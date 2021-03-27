class User < ApplicationRecord
  has_many :friends
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :password, confirmation: true

  enum role: %w(regular admin)
end
