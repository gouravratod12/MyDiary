Rails.application.routes.draw do



  get 'sellers/index'

  root "admins#index"

  resources :admins
  resources :customers
  resources :products
  resources :bills
  resources :items

  resources :bills do
    member do
      get 'show_items'
    end
  end

end
