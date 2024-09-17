Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :redirections, only: [:create, :new]

  get "/:alias", to: "redirections#redirect", as: :redirect
  get "/:alias/info", to: "redirections#show", as: :redirection_info

  root "redirections#new"
end
