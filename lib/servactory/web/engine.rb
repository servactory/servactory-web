# frozen_string_literal: true

module Servactory
  module Web
    class Engine < ::Rails::Engine
      initializer "servactory.web.assets" do |app|
        app.config.assets.precompile += %w[servactory/web/compiled.css]
      end
    end
  end
end
