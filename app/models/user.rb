class User < ApplicationRecord
  has_secure_password

  validates :user_name, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, confirmation: { case_sensitive: true }

  has_many :user_viewing_parties
  has_many :parties, through: :user_viewing_parties
end
