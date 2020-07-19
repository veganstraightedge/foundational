class User < ApplicationRecord
  rolify
  devise :confirmable, :database_authenticatable, :invitable, :lockable,
         :recoverable, :registerable, :rememberable, :timeoutable, :validatable

         before_validation :sanitize_username

  validates :username,
            format: { with: /\A[\w\d]+\z/ },
            length: { minimum: 1, maximum: 50, },
            presence: true,
            uniqueness: true,
            allow_blank: true

  private

  def sanitize_username
    self.username.strip!
  end
end
