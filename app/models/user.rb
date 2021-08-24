class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password, confirmation: { case_sensitive: true }
  has_many :friendships
  has_many :attendees
  has_many :watch_parties, through: :attendees

  has_secure_password
end
