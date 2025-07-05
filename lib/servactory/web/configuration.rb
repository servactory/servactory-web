# frozen_string_literal: true

module Servactory
  module Web
    class Configuration
      attr_accessor :app_name,
                    :app_url

      attr_reader :app_services_directory,
                  :app_services_class_base

      def initialize
        @app_services_directory = Rails.root.join(value)
        @app_services_class_base = safe_constantize_from("ApplicationService::Base")
        @app_url = nil
      end

      def app_services_directory=(value)
        @app_services_directory = Rails.root.join(value)
      end

      def app_services_class_base=(value)
        @app_services_class_base = safe_constantize_from(value)
      end

      def documentation_url
        "https://servactory.com/"
      end

      def github_url
        "https://github.com/servactory/servactory"
      end

      private

      def safe_constantize_from(value)
        if value.is_a?(String)
          value.safe_constantize
        else
          value
        end
      end
    end
  end
end
