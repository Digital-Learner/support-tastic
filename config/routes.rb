Rails.application.routes.draw do
  resources :tickets do
    resources :comments
  end

  get  "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  root 'supporttastic#home'
end
