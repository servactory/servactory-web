# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      class CodeBlockComponent < ViewComponent::Base
        def initialize(code:, language: "ruby", copy_button: true)
          super()
          @code = code
          @language = language
          @copy_button = copy_button
        end
      end
    end
  end
end
