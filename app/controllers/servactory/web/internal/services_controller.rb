# frozen_string_literal: true

module Servactory
  module Web
    module Internal
      class ServicesController < ActionController::Base
        layout "servactory/web/application"

        def index
          @app_services_tree = Servactory::Web::Services::Internal::TreeBuilder.build
        end

        def show
          service_data = Servactory::Web::Services::Internal::TreeBuilder.find_service(params[:id])
          @file_path = service_data[:file_path]
          @service_class = service_data[:service_class]
          @source_code = service_data[:source_code]
        end
      end
    end
  end
end
