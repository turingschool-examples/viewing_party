class ViewParty < ApplicationRecord
  validates :title, :date, :time, :duration, :poster, presence: true
  belongs_to :user
  has_many :party_guests
end
