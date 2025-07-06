# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Organisms
        class CardComponent < ViewComponent::Base
          include Servactory::Web::UiKit::Concerns::ComponentOptions
          renders_one :header
          def initialize(class_name: nil, options: {})
            super()
            initialize_component_options(class_name:, options:)
          end
        end
      end
    end
  end
end
