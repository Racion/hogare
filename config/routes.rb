Rails.application.routes.draw do
  get 'orders/new'
  get 'orders/show'
  get 'orders/create'
  get 'orders/destroy'
  get 'orders/edit'
  devise_for :users
  root 'application#home'
  
  get 'application/profile'
  get 'application/new_service'
  get 'application/cart'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
