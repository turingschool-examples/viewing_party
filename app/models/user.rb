class User < ApplicationRecord

  has_secure_password

  has_many :friends, foreign_key: :friendee_id, dependent: :destroy
  has_many :friendees, through: :friends
  has_many :friend_alias, class_name: 'Friend', foreign_key: :friender_id, dependent: :destroy
  has_many :frienders, through: :friend_alias

  # has_many :attendees, dependent: :destroy
  # has_many :viewing_parties, through: :attendees
  # has_many :viewing_parties, dependent: :destroy
  
  # validates :email, uniqueness: true, presence: true
  # validates_presence_of :password_digest, require: true

end
