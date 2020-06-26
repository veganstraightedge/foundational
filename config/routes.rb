Rails.application.routes.draw do
  # homepage
  root to: "home#index"

  # auth
  devise_for :users

  devise_scope :user do
    get 'signup',  to: 'devise/registrations#new'
    get 'signin',  to: 'devise/sessions#new'
    get 'signout', to: 'devise/sessions#destroy'
  end
end
