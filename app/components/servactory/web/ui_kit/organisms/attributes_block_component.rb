# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Organisms
        class AttributesBlockComponent < ViewComponent::Base
          include Servactory::Web::UiKit::Concerns::ComponentOptions

          def initialize(inputs: nil, internals: nil, outputs: nil, class_name: nil, options: {})
            super()
            @inputs = inputs
            @internals = internals
            @outputs = outputs
            initialize_component_options(class_name:, options:)
          end

          def render?
            @inputs.present? || @internals.present? || @outputs.present?
          end
        end
      end
    end
  end
end
