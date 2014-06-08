Rails.application.routes.draw do
  devise_for :users
  resources :mindsets, only: [:create, :new]
  root to: "high_voltage/pages#show", id: "about"
end
