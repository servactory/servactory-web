# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Molecules
        class AttributeItemComponent < ViewComponent::Base
          include Servactory::Web::UiKit::Concerns::ComponentOptions
          def initialize(name:, border_class:, text_class:, bg_class:, attribute: nil, class_name: nil, options: {})
            super()
            @name = name
            @border_class = border_class
            @text_class = text_class
            @bg_class = bg_class
            @attribute = attribute
            @required = @attribute.respond_to?(:required?) ? @attribute.required? : nil
            initialize_component_options(class_name:, options:)
          end
        end
      end
    end
  end
end
