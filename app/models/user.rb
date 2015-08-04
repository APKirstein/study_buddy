class User < ActiveRecord::Base
  validates :email, presence: true
  validates :username, presence: true
  validates :year, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
