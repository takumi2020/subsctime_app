Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  resources :users, only: [:show, :index]

  root to: "products#index"
  resources :products do 
    resources :comments, only: :create
    member do
      post 'purchase'
      get 'done'
    end
    collection do
      get 'about', to: 'products#about'
      get 'search'
    end
    resource :favorites, only: [:create, :destroy]
  end
  
  resources :cards, only: [:new, :show,] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

  resources :contacts, only: [:new, :create]
end