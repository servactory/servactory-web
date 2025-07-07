# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Organisms
        class TreeNodeComponent < ViewComponent::Base
          def initialize(node:, route_type:, level: 0, gem_name: nil)
            super()

            @node = node
            @level = level
            @route_type = route_type
            @gem_name = gem_name
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
end
