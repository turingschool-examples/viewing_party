class User < ApplicationRecord
  has_many :friends, dependent: :destroy
  has_many :parties, foreign_key: :host_id, dependent: :destroy, inverse_of: :host
  has_many :guests, dependent: :destroy

  validates :email, presence: true
  validates :name, presence: true
  validates :password_digest, presence: true
  validates_confirmation_of :password

  has_secure_password
end
