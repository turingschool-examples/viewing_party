class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :viewers
  has_many :parties, through: :viewers

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

  has_secure_password
  validates :password, presence: true, allow_blank: false
  validates :password, confirmation: { case_sensitive: true }
end
