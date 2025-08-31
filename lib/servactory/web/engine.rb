# frozen_string_literal: true

module Servactory
  module Web
    class Engine < ::Rails::Engine
      # TODO: # => ::Servactory (?)
      # isolate_namespace Servactory::Web

      config.servactory_web = Servactory::Web::Configuration.new

      def self.configure
        yield(config.servactory_web) if block_given?
      end

      initializer "servactory.web.validate_configuration" do
        config.after_initialize do
          unless config.servactory_web.valid?
            errors = config.servactory_web.errors.full_messages
            raise "Invalid Servactory Web configuration: #{errors.join(', ')}"
          end
        end
      end

      initializer "servactory.web.assets" do |app|
        app.config.assets.precompile += %w[servactory/web/compiled.css]
      end
    end
  end
end
