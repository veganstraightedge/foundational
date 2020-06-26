class ApplicationController < ActionController::Base
  # For Devise
  ActiveSupport.on_load(:devise_failure_app) do
    include Turbolinks::Controller
  end
end
