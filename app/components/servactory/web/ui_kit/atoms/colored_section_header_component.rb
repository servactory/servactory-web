# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Atoms
        class ColoredSectionHeaderComponent < ViewComponent::Base
          include Servactory::Web::UiKit::Concerns::ComponentOptions

          def initialize(title:, border_class:, bg_class:, text_class:, class_name: nil, options: {})
            super()
            @title = title
            @border_class = border_class
            @bg_class = bg_class
            @text_class = text_class
            initialize_component_options(class_name:, options:)
          end
        end
      end
    end
  end
end
