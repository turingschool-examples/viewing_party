class User < ApplicationRecord
  has_secure_password

  validates :username, :email, uniqueness: true, presence: true
  validates :password, presence: true, on: :create
end
