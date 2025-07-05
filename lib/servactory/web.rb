# frozen_string_literal: true

require "active_support/all"

require "servactory/web/support/loader"

module Servactory
  module Web; end
end

require "servactory/web/engine" if defined?(Rails::Engine)
