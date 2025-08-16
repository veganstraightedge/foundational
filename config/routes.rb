Rails.application.routes.draw do
  # homepage
  root to: 'home#index'

  # main resources
  resources :categories, only: %i[index show]
  resources :tags,       only: %i[index show]

  # admin
  namespace :admin do
    resources :tags
    resources :taggings
    resources :categories
    resources :categorizations

    root to: 'categories#index'
  end

  # admin site settings
  resources :settings, only: %i[index edit update]
end
