Rails.application.routes.draw do
  get "reviews/new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

    # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
    # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
    # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

    # Defines the root path route ("/")
    # root "posts#index"
    root "lists#index"
    resources :lists, only: [ :index, :new, :create, :show ] do
      resources :bookmarks, only: [ :new, :create ]
      resources :reviews, only: [ :new, :create ]
      end
        resources :bookmarks, only: [ :destroy ]
        resources :reviews, only: [ :destroy ]


  # En tant qu’utilisateur, je peux voir toutes mes listes de films. (index) lists
  # En tant qu’utilisateur, je peux créer une liste de films. (create) lists
  # En tant qu’utilisateur, je peux voir les détails d’une liste de films. (show) lists

  # En tant qu’utilisateur, je peux marquer (bookmark) un film dans une liste de films. (create) list => bookmarks
  # En tant qu’utilisateur, je peux détruire un bookmark. (delete) bookmarks
end
