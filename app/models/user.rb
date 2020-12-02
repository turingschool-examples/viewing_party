class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email
  validates_confirmation_of :password

  has_many :guests
  has_many :parties, through: :guests
end
