class ViewingPartyUser < ApplicationRecord
  has_many :users
  has_many :viewing_parties
end
