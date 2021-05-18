class User < ApplicationRecord
  has_many :friendships, foreign_key: 'user_id', class_name: 'Friend'
  has_many :friends, through: :friendships, dependent: :destroy
  has_many :parties, foreign_key: :host_id, dependent: :destroy, inverse_of: :host
  has_many :guests, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password_digest, presence: true
  validates :password, confirmation: true, presence: true, on: :create

  has_secure_password
end
