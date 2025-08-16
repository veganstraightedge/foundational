class PasswordsMailer < ApplicationMailer
  def reset user
    @user = user
    @token = user.generate_token_for(:password_reset)
    mail subject: 'Reset your password', to: user.email_address
  end
end
