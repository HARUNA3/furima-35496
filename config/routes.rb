Rails.application.routes.draw do
  devise_for :users
  root to: "item#index"
  resources :item do
    resources :purchase, only: [:new, :create, :index]
  end
end
