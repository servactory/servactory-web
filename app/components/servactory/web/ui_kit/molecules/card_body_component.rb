# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Molecules
        class CardBodyComponent < ViewComponent::Base
          def initialize(class_name: nil, options: {})
            super()
            @class_name = class_name
            @options = options
          end
        end
      end
    end
  end
end
