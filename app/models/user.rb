class User < ActiveRecord::Base
  validates :email, presence: true
  validates :username, presence: true, length: { minimum: 3 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
