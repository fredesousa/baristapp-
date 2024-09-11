Rails.application.routes.draw do
  devise_for :users
  resources :preferences, only: [:create, :show, :new]

  get "up" => "rails/health#show", as: :rails_health_check
  get 'marketplace/:id', to: 'marketplace#show', as: 'marketplace'
  get 'contact', to: 'pages#contact', as: 'contact'
  
  root to: 'pages#home'

  resources :coffees, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      post 'add_to_cart', to: 'carts#add'
    end
    resources :favorites, only: [:create]
    resources :reviews, only: [:create] do
    end
  end
  resources :reviews, only: [] do
    resources :likes, only: [:create, :destroy]
  end
  resources :favorites, only: [:destroy]
  resources :carts, only: [:show] do
    patch 'update/:id', to: 'carts#update', as: 'update_cart'
    delete 'remove/:id', to: 'carts#remove', as: 'remove_cart'
    post 'checkout', to: 'carts#checkout', as: 'checkout_cart'
  end
  


  get 'profil', to: 'pages#profil', as: 'profil'
  get 'about', to: 'pages#about', as: 'about'
end
