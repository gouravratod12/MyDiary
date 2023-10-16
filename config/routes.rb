Rails.application.routes.draw do

  root "admins#index"

  resources :customers

end
