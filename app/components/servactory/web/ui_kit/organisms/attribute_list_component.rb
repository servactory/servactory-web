# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Organisms
        class AttributeListComponent < ViewComponent::Base
          include Servactory::Web::UiKit::Concerns::ComponentOptions
          def initialize(items:, border_class:, text_class:, bg_class:, empty_message:, class_name: nil, options: {})
            super()
            @items = items
            @border_class = border_class
            @text_class = text_class
            @bg_class = bg_class
            @empty_message = empty_message
            initialize_component_options(class_name:, options:)
          end
        end
      end
    end
  end
end
