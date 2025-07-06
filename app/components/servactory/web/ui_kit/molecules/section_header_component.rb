# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Molecules
        class SectionHeaderComponent < ViewComponent::Base
          include Servactory::Web::UiKit::Concerns::ComponentOptions
          def initialize(title:, icon_type:, icon_color: nil, class_name: nil, options: {})
            super()
            @title = title
            @icon_type = icon_type
            @icon_color = icon_color
            initialize_component_options(class_name:, options:)
          end
        end
      end
    end
  end
end
