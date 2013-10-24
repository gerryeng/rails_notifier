$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "notifier/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "notifier"
  s.version     = Notifier::VERSION
  s.authors     = ["Gerry Eng"]
  s.email       = ["m@gerryeng.com"]
  s.homepage    = "http://gerryeng.com"
  s.summary     = "Rails Notification Helper"
  s.description = "A notification service to help developers send internal alerts"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "haml-rails"

  s.add_development_dependency 'rspec-rails'
end
