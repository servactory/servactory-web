# frozen_string_literal: true

module Servactory
  module Web
    module UiKit
      class FooterComponent < ViewComponent::Base
        def initialize(year:, documentation_url:, github_url:, version:, release_url:)
          super()
          @year = year
          @documentation_url = documentation_url
          @github_url = github_url
          @version = version
          @release_url = release_url
        end
      end
    end
  end
end
