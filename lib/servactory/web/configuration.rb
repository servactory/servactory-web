# frozen_string_literal: true

module Servactory
  module Web
    class Configuration
      attr_accessor :app_name,
                    :app_url,
                    :gem_names,
                    :gem_service_directories

      attr_reader :app_services_directory

      def initialize
        @app_services_directory = Rails.root.join("app/services")
        @app_url = nil
        @gem_names = []
        @gem_service_directories = %w[app/services lib]
      end

      def app_services_directory=(value)
        @app_services_directory = Rails.root.join(value)
      end

      def documentation_url
        "https://servactory.com"
      end

      def github_url
        "https://github.com/servactory/servactory"
      end

      def release_url_for(version)
        "https://github.com/servactory/servactory/releases/tag/v#{version}"
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
