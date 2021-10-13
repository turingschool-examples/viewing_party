class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :first_name, require: true
  validates_presence_of :last_name, require: true

  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end
end
