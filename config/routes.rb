Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  resources :devices, except: [:show] do
    member do
      resources :measurements, only: [:index, :create] do
        collection do
          namespace :measurements do
            resources :currents
            resources :archives
          end
        end
      end
    end
  end
  resources :locations, except: [:show]
end
