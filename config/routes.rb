Rails.application.routes.draw do
  get 'order_details/create'

  resources :orders do
    collection do
      get 'summary', to: 'orders#index'
      get 'checkout', to: 'orders#new'
      get 'error', to: 'orders#error'
      post 'orders', to: 'orders#create'
    end
  end

  resources :users do
    collection do
      get 'show'
      get 'user/:username', to: 'users#show'
      get 'register', to: 'users#new'
      post 'users', to: 'users#create'
    end
  end

  # search routes
  get 'search/products'
  get 'search/categories'

  resources :categories, only: [:index, :show]

  resources :products do
    collection do
      get 'index'
      get 'new'
      get 'updated'
    end
    member do
      post :add_to_cart
      post :remove_from_cart
    end
  end

  get '/categories/:id', to: 'categories#show', id: /\d+/
  get '/categories/', to: 'categories#index'

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'

  root to: 'products#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
