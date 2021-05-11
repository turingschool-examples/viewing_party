class User < ApplicationRecord
  has_and_belongs_to_many :friends,
              class_name: 'User',
              join_table: :friendships,
              foreign_key: :user_id,
              association_foreign_key: :friend_id

  has_many :parties
  has_many :movies, through: :parties


  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates :password_digest, presence: true

end
