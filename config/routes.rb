Rails.application.routes.draw do
  devise_for :users
  root 'application#home'
  
  get 'application/profile'
  get 'application/new_service'
  get 'application/cart'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
