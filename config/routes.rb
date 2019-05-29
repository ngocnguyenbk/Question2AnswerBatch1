Rails.application.routes.draw do
  get "users/new"
  get "/login",   to: "sessions#new"
  post "/login",  to: "sessions#create"
  delete  "/logout",  to: "sessions#destroy"
  root "static_page#index"

  resources :users
  resources :account_activations, only: [:edit]
  resources :questions, only: [:new, :create]
end
