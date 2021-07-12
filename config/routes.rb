Rails.application.routes.draw do
  get 'weeks/index'
  resources :meals
  resources :weeks do
    resources :days
  end

  root to: 'dashboard#index'
end
