class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :username, presence: true
  validates :password, presence: { require: true }
  has_secure_password
end
