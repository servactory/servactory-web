# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Molecules
        class AttributeSectionComponent < ViewComponent::Base
          include Servactory::Web::UiKit::Concerns::ComponentOptions

          def initialize(title:, items:, border_class:, bg_class:, text_class:, empty_message: nil, class_name: nil,
                         options: {})
            super()
            @title = title
            @items = items
            @border_class = border_class
            @bg_class = bg_class
            @text_class = text_class
            @empty_message = empty_message
            initialize_component_options(class_name:, options:)
          end
        end
      end
    end
  end
end
