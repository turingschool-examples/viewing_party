class ViewingParty < ApplicationRecord
  belongs_to :user
  has_many :guests
  has_many :users, through: :guests
end
