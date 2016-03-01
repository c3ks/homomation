Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  resources :devices, except: [:show]
  resources :locations, except: [:show]
end
