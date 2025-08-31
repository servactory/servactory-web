# frozen_string_literal: true

module Servactory
  module Web
    class Configuration
      include ::ActiveModel::Validations

      attr_accessor :mount_path,
                    :app_name,
                    :app_url,
                    :gem_names,
                    :app_services_directory,
                    :gem_service_directories

      validates :mount_path, presence: true

      validates :app_name, presence: true
      validates :app_url, presence: true

      validates :app_services_directory, presence: true

      def initialize
        @mount_path = :services
        @app_services_directory = "app/services"
        @gem_names = []
        @gem_service_directories = %w[app/services lib]
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
