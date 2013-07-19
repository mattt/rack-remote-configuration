require "bundler"
Bundler.setup

gemspec = eval(File.read("rack-remote-configuration.gemspec"))

task :build => "#{gemspec.full_name}.gem"

file "#{gemspec.full_name}.gem" => gemspec.files + ["rack-remote-configuration.gemspec"] do
  system "gem build rack-remote-configuration.gemspec"
end
