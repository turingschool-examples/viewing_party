class User < ApplicationRecord
  has_secure_password

  validates :username, :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
end
