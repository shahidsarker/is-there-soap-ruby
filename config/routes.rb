Rails.application.routes.draw do
  resources :categories
  resources :area_items do
    member do
      get 'full', to: 'area_items#full'
      put 'full', to: 'area_items#full'
      put 'half', to: 'area_items#half'
      put 'empty', to: 'area_items#empty'
    end
  end
  resources :items
  resources :space_users
  devise_for :users
  resources :areas
  resources :spaces
  root to: 'spaces#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
