Rails.application.routes.draw do
  # homepage
  root to: 'home#index'

  # main resources
  resources :categories, only: %i[index show]
  resources :tags,       only: %i[index show]

  # admin site settings
  resources :settings, only: %i[index edit update]
end
