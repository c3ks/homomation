Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  resources :devices, except: [:show] do
    member do
      resources :measurements, only: [:index, :create] do
        collection do
          namespace :measurements do
            resources :currents, only: [:index]
            resources :archives, only: [:index]
          end
        end
      end
    end
  end
  resources :locations, except: [:show]
  resources :users, except: [:show]
end
