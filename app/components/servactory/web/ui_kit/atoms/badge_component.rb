# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Atoms
        class BadgeComponent < ViewComponent::Base
          def initialize(text:, class_name: nil)
            super()
            @text = text
            @class_name = class_name
          end
        end
      end
    end
  end
end
