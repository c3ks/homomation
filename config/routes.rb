Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  resources :devices, only: [:index]
  resources :locations, only: [:index]
end
