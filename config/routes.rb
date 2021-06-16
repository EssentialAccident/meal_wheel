Rails.application.routes.draw do
  resources :meals, only: %i[index create destroy]
  resources :weeks do
    resources :days
  end

  root to: 'dashboard#index'
end
