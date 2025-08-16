Rails.application.routes.draw do
  resource :session
  resources :registrations, only: %i[new create]
  resources :passwords, param: :token, only: %i[new create edit update]
  # homepage
  root to: 'home#index'

  # main resources
  resources :categories, only: %i[index show]
  resources :tags,       only: %i[index show]

  # admin site settings
  resources :settings, only: %i[index edit update]
end
