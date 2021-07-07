class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password

  has_many :friendships
  has_many :friends, through: :friendships
end