# frozen_string_literal: true

Servactory::Web::Engine.configure do |config|
  config.mount_path = "/services"

  config.app_name = "My App"
  config.app_url = "https://example.com"

  config.app_services_directory = "app/services"
end
