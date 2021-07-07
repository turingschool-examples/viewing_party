class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships  
  has_many :invitations
  has_many :parties, through: :invitations
end
