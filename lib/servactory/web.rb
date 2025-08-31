# frozen_string_literal: true

require "servactory/web/support/loader"

module Servactory
  module Web
  end
end

require "servactory/web/routing"

require "servactory/web/engine" if defined?(Rails::Engine)
