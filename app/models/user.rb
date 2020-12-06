class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_many :friendships
  has_many :friends, through: :friendships
  has_secure_password
end
