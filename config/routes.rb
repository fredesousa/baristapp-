Rails.application.routes.draw do
  get 'marketplace/show'
  devise_for :users
  resources :preferences, only: [:create, :show, :new]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
    get 'marketplace/:id', to: 'marketplace#show', as: 'marketplace'
  # Defines the root path route ("/")
  # root "posts#index"
  root to: 'pages#home'
  resources :coffees, only: [:index, :show, :new, :create, :edit, :update] do
    resources :favorites, only: [:create]
    resources :reviews, only: [:create] do
      resources :likes, only: [:create, :destroy]
    end
  end
  resources :favorites, only: [:destroy]
  get 'profil', to: 'pages#profil', as: 'profil'
  get 'about', to: 'pages#about', as: 'about'
end
