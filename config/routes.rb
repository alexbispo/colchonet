Rails.application.routes.draw do
  resources :rooms
  resources :users, except: :index

  resource :confirmation, only: [:show]
  resource :user_sessions, only: [:create, :new, :destroy]

  root 'home#index'
end
