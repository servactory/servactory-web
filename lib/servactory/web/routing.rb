# frozen_string_literal: true

module Servactory
  module Web
    module Routing
      def mount_servactory_web(under:, at: Engine.config.servactory_web.mount_path)
        at = Engine.config.servactory_web.mount_path = at
        # TODO: Engine.config.servactory_web.authenticate_scope = under

        mount Servactory::Web::Engine, at:
      end
    end
  end
end

ActionDispatch::Routing::Mapper.include Servactory::Web::Routing
