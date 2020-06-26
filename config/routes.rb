Rails.application.routes.draw do
  # homepage
  root to: "home#index"

  # auth
  devise_for :users
end
