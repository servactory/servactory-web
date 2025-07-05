# frozen_string_literal: true

require "servactory/web/support/loader"

module Servactory
  module Web
    module_function

    def configuration
      @configuration ||= Servactory::Web::Configuration.new
    end

    def configure
      yield(configuration)
    end

    def reset_config
      @configuration = Servactory::Web::Configuration.new
    end
  end
end

require "servactory/web/engine" if defined?(Rails::Engine)
