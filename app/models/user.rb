class User < ApplicationRecord
  has_secure_password

  PASSWORD_MINIMUM_LENGTH = 30

  validates :username, presence: true, uniqueness: true, on: %i[create update]

  validates :password,
            presence:  true,
            on:        :create,
            length:    { minimum: PASSWORD_MINIMUM_LENGTH },
            exclusion: {
              in:      [
                'mickey fickie fire cracker soap on a rope',
                'a long passphrase to meet the minimum length'
              ],
              message: 'The passphrase ‘%<value>{value}’ is prohibited.'
            }

  default_scope { order(username: :asc) }

  before_validation :strip_blankspace, on: %i[create update]

  def name
    username
  end

  private

  def strip_blankspace
    self.username = username.strip
  end
end
