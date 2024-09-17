require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :redirections, only: [ :create, :new ]

  get "/:alias", to: "redirections#redirect", as: :redirect
  get "/:alias/info", to: "redirections#show", as: :redirection_info
  get "/:alias/visits", to: "visits#index", as: :redirection_visits

  root "redirections#new"
end
