class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :parties, foreign_key: :host_id, dependent: :destroy
  has_many :invitations
end
