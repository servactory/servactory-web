# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Atoms
        class CardHeaderTextComponent < ViewComponent::Base
          def initialize(text:, class_name: nil, options: {})
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
