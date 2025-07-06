# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      class AttributeItemComponent < ViewComponent::Base
        include Concerns::ComponentOptions
        def initialize(name:, border_class:, text_class:, bg_class:, required: nil, class_name: nil, options: {})
          super()
          @name = name
          @border_class = border_class
          @text_class = text_class
          @bg_class = bg_class
          @required = required
          initialize_component_options(class_name:, options:)
        end
      end
    end
  end
end
