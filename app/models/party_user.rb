class PartyUser < ApplicationRecord
  belongs_to :user
  belongs_to :movie_party
end
