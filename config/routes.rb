Rails.application.routes.draw do
  # TODO: add real root
  root to: "users#index"

  namespace :admin do
    resources :users

    root to: "users#index"
  end
end
