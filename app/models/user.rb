class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  has_many :friendships
  has_many :attendees
  has_many :watch_parties, through: :attendees
end