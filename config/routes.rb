Rails.application.routes.draw do
  devise_for :users
  root 'chatrooms#index'
  resources :chatrooms
end
