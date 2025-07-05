# frozen_string_literal: true

require_relative "lib/servactory/web/version"

Gem::Specification.new do |spec|
  spec.name          = "servactory-web"
  spec.version       = Servactory::Web::VERSION::STRING
  spec.platform      = Gem::Platform::RUBY

  spec.authors       = ["Anton Sokolov"]
  spec.email         = ["profox.rus@gmail.com"]

  spec.summary       = "Web UI for Servactory"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/servactory/servactory-web"

  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["documentation_uri"] = "https://servactory.com"
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["bug_tracker_uri"] = "#{spec.homepage}/issues"
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["app/**/*", "config/**/*", "lib/**/*", "Rakefile", "README.md"]
               .reject { |f| f == "app/assets/stylesheets/servactory/web/source.tailwind.css" }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = Gem::Requirement.new(">= 3.2")

  spec.add_dependency "rails", ">= 5.1", "< 8.1"
  spec.add_dependency "servactory", ">= 2.15"
  spec.add_dependency "zeitwerk", ">= 2.6"

  spec.add_development_dependency "appraisal", ">= 2.5"
  spec.add_development_dependency "propshaft", ">= 1.1"
  spec.add_development_dependency "rake", ">= 13.2"
  spec.add_development_dependency "rbs", ">= 3.8"
  spec.add_development_dependency "rspec", ">= 3.13"
  spec.add_development_dependency "servactory-rubocop", ">= 0.9"
end
