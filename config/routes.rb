Rails.application.routes.draw do
  devise_for :users
  resources :preferences, only: [:create, :show, :new]

  get "up" => "rails/health#show", as: :rails_health_check
  get 'marketplace/:id', to: 'marketplace#show', as: 'marketplace'

  root to: 'pages#home'

  resources :coffees, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      post 'add_to_cart', to: 'carts#add'
    end
    resources :likes, only: [:create, :destroy]
    resources :favorites, only: [:create]
    resources :reviews, only: [:create] do
    end
  end

  resources :favorites, only: [:destroy]
  resource :cart, only: [:show] do
    post 'checkout', on: :collection
  end

  get 'profil', to: 'pages#profil', as: 'profil'
end
