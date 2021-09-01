class User < ApplicationRecord
  #friends shows join table friends, followers shows users who are friends
  has_many :friends, foreign_key: :followed_id, class_name: 'Friend'
  has_many :followers, through: :friends
  #follows shows join table friends, followed shows users who the User has followed
  has_many :follows, foreign_key: :follower_id, class_name: 'Friend'
  has_many :followed, through: :follows

  has_many :parties
  has_many :attendees

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password
end
