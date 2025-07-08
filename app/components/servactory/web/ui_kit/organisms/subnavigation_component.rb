# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Organisms
        class SubnavigationComponent < ViewComponent::Base
          include Servactory::Web::UiKit::Concerns::ComponentOptions

          def initialize(gem_names:, active_gem_name: nil, class_name: nil, options: {})
            super()
            @gem_names = gem_names
            @active_gem_name = active_gem_name
            initialize_component_options(class_name:, options:)
          end

          private

          def links # rubocop:disable Metrics/MethodLength
            links = [
              {
                text: "Application",
                href: Servactory::Web::Engine.routes.url_helpers.internal_services_path,
                active: @active_gem_name.nil?
              }
            ]
            @gem_names.each do |gem_name|
              links << {
                text: gem_name.to_s,
                href: Servactory::Web::Engine.routes.url_helpers.external_services_path(gem_name),
                active: gem_name.to_s == @active_gem_name.to_s
              }
            end
            links
          end

          def link_classes(link)
            base = "text-sm font-medium transition-colors"
            active = link[:active] ? "text-blue-600 font-semibold" : "text-gray-700 hover:text-blue-600"
            [base, active].join(" ")
          end

          def render?
            @gem_names.present?
          end
        end
      end
    end
  end
end
