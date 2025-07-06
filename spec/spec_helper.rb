# frozen_string_literal: true

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require "propshaft"
require "servactory"

require_relative "sandbox/config/environment"

require "capybara/rspec"
require "rspec/rails"
require "view_component"
require "servactory/web"

Dir[File.join(__dir__, "support", "**", "*.rb")].each { |file| require file }

# I18n.load_path += Dir["#{File.expand_path('config/locales')}/*.yml"]

RSpec.configure do |config|
  config.include ViewComponent::TestHelpers, type: :component
  config.include ViewComponent::SystemTestHelpers, type: :component
  config.include Capybara::RSpecMatchers, type: :component

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect

    # Configures the maximum character length that RSpec will print while
    # formatting an object. You can set length to nil to prevent RSpec from
    # doing truncation.
    c.max_formatted_output_length = nil
  end
end
