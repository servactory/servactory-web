# frozen_string_literal: true

module Servactory
  module Web
    module External
      class ServicesController < ActionController::Base
        layout "servactory/web/application"

        before_action :assign_gem

        def index
          @gem_services_tree = Servactory::Web::Services::External::TreeBuilder.build(@gem)
        end

        def show
          service_data = Servactory::Web::Services::External::TreeBuilder.find_service(@gem, params[:id])
          @base_path = service_data[:base_path]
          @file_path = service_data[:file_path]
          @service_class = service_data[:service_class]
          @source_code = service_data[:source_code]
        end

        private

        def assign_gem
          @gem = Bundler.definition.specs.find { |s| s.name == params[:gem_name] }
        end
      end
    end
  end
end
