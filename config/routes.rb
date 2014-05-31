Rails.application.routes.draw do
  devise_for :users
  resources :emotions, only: [:index], defaults: {format: :json}
  resources :mindsets, only: [:create], defaults: {format: :json}
end
