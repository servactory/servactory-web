# frozen_string_literal: true

Servactory::Web::Engine.routes.draw do
  root "servactory/web/internal/services#index"

  scope :internal, as: :internal do
    resources :services, only: %i[index show], controller: "servactory/web/internal/services"
  end

  scope :external, as: :external do
    scope ":gem_name" do
      resources :services, only: %i[index show], controller: "servactory/web/external/services"
    end
  end
end
