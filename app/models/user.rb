class User < ApplicationRecord
  devise :confirmable, :database_authenticatable, :lockable, :recoverable,
         :registerable, :rememberable, :timeoutable, :validatable
end
