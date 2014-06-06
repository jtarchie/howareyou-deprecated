Rails.application.routes.draw do
  devise_for :users
  resources :mindsets, only: [:create, :new]
  root to: "mindsets#new"
end
