class Party < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  has_many :party_friends
  has_many :friendships, through: :party_friends
end
