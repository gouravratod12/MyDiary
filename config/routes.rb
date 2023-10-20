Rails.application.routes.draw do

  get 'product_bills/index'

  root "admins#index"

  resources :customers
  resources :products
  resources :bills
  resources :items

end
