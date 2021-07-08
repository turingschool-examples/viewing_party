class User < ApplicationRecord
  # attr_accessor :password
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships  
  has_many :invitations
  has_many :parties, through: :invitations

  validates_uniqueness_of :email
  validates_presence_of :email, :password
  validates_length_of :password, in: 8..30
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password
end
