class Party < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  belongs_to :party_friends
  has_many :friendship, through: :party_friends
end
