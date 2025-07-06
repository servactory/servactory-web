# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      class NavbarComponent < ViewComponent::Base
        def initialize(app_name:, documentation_url:, github_url:, app_url: nil)
          super()
          @app_name = app_name
          @app_url = app_url
          @documentation_url = documentation_url
          @github_url = github_url
        end
      end
    end
  end
end
