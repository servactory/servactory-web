# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Organisms
        class TreeComponent < ViewComponent::Base
          include Servactory::Web::UiKit::Concerns::ComponentOptions
          def initialize(route_type:, nodes: [], class_name: nil, options: {}, gem_name: nil)
            super()
            @nodes = nodes
            @route_type = route_type
            @gem_name = gem_name
            initialize_component_options(class_name:, options:)
          end
        end
      end
    end
  end
end
