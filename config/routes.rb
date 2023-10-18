Rails.application.routes.draw do

  get 'product_bills/index'

  root "admins#index"

  resources :customers
  resources :products
  resources :bill_managers
  resources :product_bills

end
