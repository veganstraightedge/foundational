class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :username,
            presence:   true,
            uniqueness: true,
            length:     { minimum: 3, maximum: 30 },
            format:     { with: /\A[a-zA-Z0-9_]+\z/, message: 'can only contain letters, numbers, and underscores' }

  validates :password, length: { minimum: 8 }, if: -> { new_record? || !password.nil? }

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  normalizes :username,      with: ->(u) { u.strip.downcase }

  generates_token_for :password_reset, expires_in: 20.minutes do
    password_salt&.last(10)
  end

  def self.find_by_password_reset_token! token
    find_by_token_for!(:password_reset, token)
  end
end
