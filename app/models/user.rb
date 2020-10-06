class User < ApplicationRecord
  has_secure_password

  has_many :friendships

  has_many :friended_users, foreign_key: :friender_id, class_name: 'Friendship'
  has_many :frienders, through: :friended_users

  has_many :friender_users, foreign_key: :friended_id, class_name: 'Friendship'
  has_many :friendeds, through: :friender_users

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
end
