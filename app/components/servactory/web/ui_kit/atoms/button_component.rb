# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      class ButtonComponent < ViewComponent::Base
        include Concerns::ComponentOptions
        def initialize(text:, icon_type: nil, class_name: nil, options: {})
          super()
          @text = text
          @icon_type = icon_type
          initialize_component_options(class_name:, options:)
        end
      end
    end
  end
end
