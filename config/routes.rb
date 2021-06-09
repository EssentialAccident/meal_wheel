Rails.application.routes.draw do
  resources :meals, only: [:index, :create, :destroy]
  root 'dashboard#index'
end
