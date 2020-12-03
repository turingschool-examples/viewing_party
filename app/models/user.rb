class User < ApplicationRecord
  has_secure_password
  has_many :guests
  has_many :viewings, through: :guests

  validates :username, :email, uniqueness: true, presence: true
  validates :password, presence: true, on: :create
end
