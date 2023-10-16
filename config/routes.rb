Rails.application.routes.draw do

  root "admins#index"

  resources :customers
  resources :products
  reosurces :bill_managers

end
