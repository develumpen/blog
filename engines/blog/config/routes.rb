Blog::Engine.routes.draw do
  get "admin", to: redirect("admin/entries")
  namespace :admin do
    resources :comments, only: %i[ index ]
    resources :entries, only: %i[ index new edit create update destroy ]
    resources :media_items, only: %i[ index create destroy ]
    resources :tags
  end

  resources :entries, only: %i[ index ] do
    resources :comments, only: %i[ create destroy ], shallow: true
  end

  get "/feed", to: "feeds#show", defaults: { format: "atom" }
  get "/:slug", to: "entries#show", as: :entry_slug

  root "entries#index"
end
