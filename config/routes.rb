Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  get "admin", to: redirect("admin/entries")
  namespace :admin do
    resources :entries, only: %i[ index new edit create update destroy ]
  end

  get "/feed", to: "feeds#show", defaults: { format: "atom" }
  resources :entries, only: %i[ index ] do
    resources :comments, only: %i[ create destroy ], shallow: true
  end
  get "/:slug", to: "entries#show", as: :entry_slug
  resource :session

  # Defines the root path route ("/")
  root "entries#index"
end
