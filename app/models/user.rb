class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :username, presence: true
  validates :password, presence: { require: true }
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  has_secure_password

end
