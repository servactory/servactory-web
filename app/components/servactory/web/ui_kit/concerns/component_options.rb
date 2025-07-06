# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      module Concerns
        module ComponentOptions
          extend ActiveSupport::Concern

          included do
            attr_reader :class_name, :options
          end

          def initialize_component_options(class_name: nil, options: {})
            @class_name = class_name
            @options = options
          end
        end
      end
    end
  end
end
