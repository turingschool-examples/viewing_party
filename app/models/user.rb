class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
end
