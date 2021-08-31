Rails.application.routes.draw do
  get 'weeks/index'

  resources :users
  resources :meals, only: %i[index create destroy]
  resources :weeks do
    resources :days
  end

  root to: 'dashboard#index'
end
