Rails.application.routes.draw do
  resources :tickets

  get  "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  root 'tickets#index'
end
