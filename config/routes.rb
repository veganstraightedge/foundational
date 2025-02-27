require 'sidekiq/web'

Rails.application.routes.draw do
  # sidekiq dashboard
  authenticate :user, ->(user) { user.has_role? :admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # homepage
  root to: 'home#index'

  # main resources
  get '@:username', to: 'users#show', as: :profile

  resources :categories, only: %i[index show]
  resources :tags,       only: %i[index show]

  # auth
  devise_for :users

  devise_scope :user do
    get 'signup',  to: 'devise/registrations#new'
    get 'signin',  to: 'devise/sessions#new'
    get 'signout', to: 'devise/sessions#destroy'

    get 'account', to: 'devise/registrations#edit'
  end

  # admin
  namespace :admin do
    resources :users
    resources :tags
    resources :taggings
    resources :categories
    resources :categorizations

    root to: 'users#index'
  end

  # admin site settings
  resources :settings, only: %i[index edit update]
end
