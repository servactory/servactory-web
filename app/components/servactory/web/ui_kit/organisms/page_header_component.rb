# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Organisms
        class PageHeaderComponent < ViewComponent::Base
          def initialize(title:, description: nil)
            super()
            @title = title
            @description = description
          end
        end
      end
    end
  end
end
