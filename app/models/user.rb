class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, presence: true, confirmation: true
  has_secure_password
end
