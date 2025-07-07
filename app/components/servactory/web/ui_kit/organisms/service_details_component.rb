# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Organisms
        class ServiceDetailsComponent < ViewComponent::Base
          include Servactory::Web::UiKit::Concerns::ComponentOptions

          def initialize(service_class:, source_code:, class_name: nil, options: {})
            super()
            @service_class = service_class
            @source_code = source_code
            initialize_component_options(class_name:, options:)
          end

          def render?
            @service_class.present? && @source_code.present?
          end

          def inputs
            @service_class.info.inputs
          end

          def internals
            @service_class.info.internals
          end

          def outputs
            @service_class.info.outputs
          end

          def actions_data
            return {} unless @service_class.info.stages.present?

            result = {}
            @service_class.info.stages.each_value do |actions|
              result.merge!(actions)
            end
            result
          end
        end
      end
    end
  end
end
