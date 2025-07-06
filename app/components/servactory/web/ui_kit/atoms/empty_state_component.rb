# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Atoms
        class EmptyStateComponent < ViewComponent::Base
          include Servactory::Web::UiKit::Concerns::ComponentOptions
          def initialize(message:, class_name: nil, options: {})
            super()
            @message = message
            initialize_component_options(class_name:, options:)
          end
        end
      end
    end
  end
end
