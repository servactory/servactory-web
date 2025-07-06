# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      class TreeNodeComponent < ViewComponent::Base
        def initialize(node:, level: 0)
          super()

          @node = node
          @level = level
        end

        def border_class
          @level.positive? ? "border-l border-dashed border-gray-300 pl-4" : ""
        end

        def directory?
          @node[:children].present?
        end
      end
    end
  end
end
