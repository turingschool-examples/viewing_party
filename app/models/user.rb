class User < ApplicationRecord
  has_secure_password
  validates_presence_of :password, require: true
  validates :email, uniqueness: true, presence: true
end
