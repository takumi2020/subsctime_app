Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  resources :users, only: :show

  root to: "products#index"

  resources :products do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  
  resources :cards, only: [:new, :show,] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
end