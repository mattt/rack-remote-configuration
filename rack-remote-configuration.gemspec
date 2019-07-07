# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'rack/remote-configuration/version'

Gem::Specification.new do |s|
  s.name        = 'rack-remote-configuration'
  s.authors     = ['Mattt']
  s.email       = 'mattt@me.com'
  s.license     = 'MIT'
  s.homepage    = 'https://mat.tt'
  s.version     = Rack::RemoteConfiguration::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = 'Rack::RemoteConfiguration'
  s.description = 'Serve property list or JSON configuration files.'

  s.add_dependency 'json', '~> 1.8'
  s.add_dependency 'plist', '~> 3.1'
  s.add_dependency 'rack', '~> 1.4'
  s.add_dependency 'sinatra', '~> 1.3'
  s.add_dependency 'sinatra-contrib', '~> 1.4'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'

  s.files         = Dir['./**/*'].reject { |file| file =~ %r{\./(bin|example|log|pkg|script|spec|test|vendor)} }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
end
