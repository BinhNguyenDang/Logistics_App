Rails.application.routes.draw do
  resources :deadlines
  resources :vehicles
 root 'home#index'
 resources :modes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
 resources :vehicles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
 resources :prices, only: [:index, :show, :new, :create, :edit, :update, :destroy]
 resources :deadlines, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
