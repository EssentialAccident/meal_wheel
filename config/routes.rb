Rails.application.routes.draw do
  get 'weeks/index'
  resources :meals do
    resources :recipes
  end
  resources :weeks do
    resources :days
  end

  root to: 'dashboard#index'
end
