# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      class LinkComponent < ViewComponent::Base
        def initialize(href:, text:, options: {})
          super()
          @href = href
          @text = text
          @options = options
        end
      end
    end
  end
end
