# frozen_string_literal: true

module Servactory
  module Web
    class Configuration
      attr_accessor :app_services_directory,
                    :app_services_class_base

      def initialize
        @app_services_directory = "app/services"
        @app_services_class_base = ApplicationService::Servactory::Base
      end
    end
  end
end
