class User < ApplicationRecord
  rolify
  devise :confirmable, :database_authenticatable, :invitable, :lockable,
         :recoverable, :registerable, :rememberable, :timeoutable, :validatable
end
