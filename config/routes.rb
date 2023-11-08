Rails.application.routes.draw do




  root "admins#index"

  resources :admins
  resources :customers
  resources :products
  resources :bills
  resources :items
  resources :sellers

  resources :bills do
    member do
      get 'show_items'
    end
  end

  resources :products do
    member do
      get 'details', to: 'products#details'
    end
  end




end
