# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Organisms
        class ServiceNotFoundComponent < ViewComponent::Base
          include Servactory::Web::UiKit::Concerns::ComponentOptions

          def initialize(class_name: nil, options: {})
            super()
            initialize_component_options(class_name:, options:)
          end
        end
      end
    end
  end
end
