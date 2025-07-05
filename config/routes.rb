# frozen_string_literal: true

Servactory::Web::Engine.routes.draw do
  root "servactory/web/services#index"

  resources :services, only: %i[index show], controller: "servactory/web/services"
end
