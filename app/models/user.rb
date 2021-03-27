class User < ApplicationRecord
  has_many :friends
  has_many :parties
  has_many :party_friends
  has_many :parties, through: :party_friends

  validates :email, uniqueness: true, presence: true
  validates :password, presence: { require: true }
  validates :name, presence: { require: true }
  validates :password, confirmation: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  before_save {email.try(:downcase!)}
  has_secure_password
end
