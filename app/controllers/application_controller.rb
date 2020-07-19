class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_admin!,            if: :new_invitation?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up,           keys: %i[username]
    devise_parameter_sanitizer.permit :accept_invitation, keys: %i[username]
  end

  private

  def set_current_user
    Current.user = current_user
  end

  # Only allow admins to invite new users
  def new_invitation?
    controller_name == "invitations" && action_name == "new"
  end

  def authenticate_admin!
    return redirect_to :root unless Current.user.has_role?(:admin)
  end
end
