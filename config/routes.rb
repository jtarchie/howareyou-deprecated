Rails.application.routes.draw do
  devise_for :users
  resources :mindsets, only: [:create, :new]
  resource :account, only: [:show, :update], controller: :account

  root to: "high_voltage/pages#show", id: "about"
end
