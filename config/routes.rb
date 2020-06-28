Rails.application.routes.draw do
  # homepage
  root to: "home#index"

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
    resources :settings
    resources :users

    root to: "users#index"
  end

  # admin site settings
  resources :settings, only: %i[index edit update]
end
