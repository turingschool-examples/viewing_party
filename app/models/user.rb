class User < ApplicationRecord
  attr_accessor :password_confirmation
  has_secure_password

  validates :email, uniqueness: true, presence:true
  validates :password, presence: true

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  
  validates :password_confirmation, presence: true
  validates_confirmation_of :password

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users
end
