class User < ApplicationRecord
  has_secure_password

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users
  has_many :parties
  has_many :guest_lists, through: :parties

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  #not sure about this one
  # validates :user_name, uniqueness: { case_sensitive: true }
end
