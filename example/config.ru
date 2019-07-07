# frozen_string_literal: true

require 'bundler'
Bundler.require

run Rack::RemoteConfiguration.new configuration: {
  'Greeting' => 'Hello, World',
  'Price' => 4.20,
  'FeatureXIsLaunched' => true
}
