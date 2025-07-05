# frozen_string_literal: true

module Servactory
  module Web
    class ServicesController < ActionController::Base
      layout "servactory/web/application"

      def index
        @services_tree = Servactory::Web::Services::TreeBuilder.build
      end

      def show
        service_path = params[:id].to_s.gsub(%r{^services/?}, "").sub(%r{^/+}, "")
        file_path = Servactory::Web::Services::TreeBuilder::SERVICES_PATH.join("#{service_path}.rb")
        class_name = Servactory::Web::Services::TreeBuilder.class_name_from_path(Pathname.new(file_path))

        @service_class = class_name.safe_constantize
        @source_code = (File.read(file_path) if @service_class && File.exist?(file_path))
      end
    end
  end
end
