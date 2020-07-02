class User < ApplicationRecord
  rolify
  devise :confirmable, :database_authenticatable, :lockable, :recoverable,
         :registerable, :rememberable, :timeoutable, :validatable
end
