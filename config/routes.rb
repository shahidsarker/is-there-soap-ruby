Rails.application.routes.draw do
  resources :categories
  resources :area_items
  resources :items
  resources :space_users
  devise_for :users
  resources :areas
  resources :spaces
  root to: 'spaces#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
