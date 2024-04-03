Rails.application.routes.draw do
  namespace :admin do
    resources :people
  end
  
  resources :people do
    collection do
      get :admins
    end
    member do
      get :changed
    end
  end

  resources :sessions, only: %i(new create destroy)
  get "autenticar" => "sessions#new"
  post "autenticar" => "sessions#create"
  delete "sair" => "sessions#destroy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
