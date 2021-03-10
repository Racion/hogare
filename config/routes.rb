Rails.application.routes.draw do
  devise_for :users
  get 'application/profile'
  get 'application/admin_profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#home'
  resources :addresses
  resources :orders
  resources :services

end
