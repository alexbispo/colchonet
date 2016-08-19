Rails.application.routes.draw do
  resources :rooms
  resources :users, except: :index

  resource :confirmation, only: [:show]

  root 'home#index'
end
