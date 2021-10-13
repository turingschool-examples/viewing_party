class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_secure_password
end
