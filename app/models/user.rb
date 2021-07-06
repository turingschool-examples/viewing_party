class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_many :parties, dependent: :destroy, foreign_key: :host_id
  has_many :friendships, dependent: :destroy
  has_many :friends, class_name: :User, through: :friendships

  has_secure_password
end
