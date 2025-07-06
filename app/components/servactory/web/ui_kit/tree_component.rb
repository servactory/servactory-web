# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      class TreeComponent < ViewComponent::Base
        include Concerns::ComponentOptions
        def initialize(nodes: [], class_name: nil, options: {})
          super()
          @nodes = nodes
          initialize_component_options(class_name:, options:)
        end
      end
    end
  end
end
