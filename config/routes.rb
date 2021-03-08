Rails.application.routes.draw do
  resources :orders
  devise_for :users

  get 'application/profile'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#home'
  resources :addresses
  resources :services

end
