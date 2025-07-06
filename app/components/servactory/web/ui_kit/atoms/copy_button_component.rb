# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Atoms
        class CopyButtonComponent < ViewComponent::Base
          def initialize(code:)
            super()
            @code = code
          end
        end
      end
    end
  end
end
