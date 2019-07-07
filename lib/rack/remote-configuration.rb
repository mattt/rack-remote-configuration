# frozen_string_literal: true

require 'rack'
require 'sinatra/base'
require 'sinatra/respond_with'

require 'json'
require 'plist'

module Rack
  class RemoteConfiguration
    def initialize(options = {})
      raise ArgumentError, 'Missing required :configuration option' unless options[:configuration]

      path = options[:path] || '/configuration'
      configuration = case options[:configuration]
                      when Hash
                        options[:configuration]
                      when File
                        return new((begin
                                      Plist.parse_xml(configuration.path) || JSON.parse(configuration.read)
                                    rescue StandardError
                                      nil
                                    end))
                      when String
                        return new(File.open(configuration)) if File.exist?(configuration)
                      end

      raise ArgumentError, 'Invalid configuration (expected Hash or either .json or .plist File or file path)' if configuration.nil?

      begin
        %i[to_json to_plist].each do |serialization|
          configuration.send(serialization)
        end
      rescue NoMethodError => e
        raise ArgumentError, "Serialization Error: #{e}"
      end

      @app = Class.new(Sinatra::Base) do
        register Sinatra::RespondWith

        disable :raise_errors, :show_exceptions

        get path, provides: ['application/json', 'application/x-plist'] do
          respond_to do |f|
            f.on('application/json') { configuration.to_json }
            f.on('application/x-plist') { configuration.to_plist }
          end
        end
      end
    end

    def call(env)
      @app.call(env)
    end
  end
end
