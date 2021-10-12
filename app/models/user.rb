class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :first_name, require: true
  validates_presence_of :last_name, require: true

  has_secure_password
end
