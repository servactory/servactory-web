# frozen_string_literal: true

module Servactory
  module Web
    class Engine < ::Rails::Engine
      # isolate_namespace Servactory::Web

      config.servactory_web = Servactory::Web::Configuration.new

      def self.configure
        yield(config.servactory_web) if block_given?
      end

      initializer "servactory.web.assets" do |app|
        app.config.assets.precompile += %w[servactory/web/compiled.css]
      end
    end
  end
end
