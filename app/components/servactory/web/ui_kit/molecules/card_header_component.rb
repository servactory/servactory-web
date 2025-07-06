# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Molecules
        class CardHeaderComponent < ViewComponent::Base
          renders_one :right
          def initialize(text: nil, class_name: nil, options: {})
            super()
            @text = text
            @class_name = class_name
            @options = options
          end
        end
      end
    end
  end
end
