# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Organisms
        class SectionCardComponent < ViewComponent::Base
          include Servactory::Web::UiKit::Concerns::ComponentOptions
          renders_one :body
          def initialize(title:, border_class:, text_class:, bg_class:, icon_type:, empty_message:, items: nil,
                         class_name: nil, options: {})
            super()
            @title = title
            @items = items
            @border_class = border_class
            @text_class = text_class
            @bg_class = bg_class
            @icon_type = icon_type
            @empty_message = empty_message
            initialize_component_options(class_name:, options:)
          end
        end
      end
    end
  end
end
