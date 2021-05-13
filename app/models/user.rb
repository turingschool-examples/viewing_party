class User < ApplicationRecord
  has_many :friends, dependent: :destroy
  has_many :parties, foreign_key: :host_id, dependent: :destroy
  has_many :guests, dependent: :destroy

  validates :email, presence: true
  validates :name, presence: true
  validates :password_digest, presence: true

  has_secure_password
end
