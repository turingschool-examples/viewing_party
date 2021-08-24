class User < ApplicationRecord
  has_many :events
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :attendees, through: :events

  validates :username, presence: true
  validates :email, presence: true

  has_secure_password
end
