Rails.application.routes.draw do

  root "admins#index"

  resources :customers
  resources :products
  resources :bill_managers

end
