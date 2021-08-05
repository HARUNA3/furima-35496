Rails.application.routes.draw do
  devise_for :users
  root to: "item#index"
  resources :item
  resources :purchase, only: [:new, :create, :index]
end
