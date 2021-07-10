class User < ApplicationRecord
  has_many :user_friendships, dependent: :destroy
  has_many :friends, through: :user_friendships
  has_many :viewing_parties, foreign_key: :party_host_id, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password
end
