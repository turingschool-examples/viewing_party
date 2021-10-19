class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :attendees, dependent: :destroy
  has_many :parties, through: :attendees
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, class_name: 'User'

  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end
end
