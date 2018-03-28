Rails.application.routes.draw do
  resources :categories, only: [:index, :show]
  resources :products, only: [:index, :show]

  get '/categories/:id', to: 'categories#show'
  get '/categories/', to: 'categories#index'

  root to: 'products#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
