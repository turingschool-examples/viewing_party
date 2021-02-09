class Party < ApplicationRecord
	belongs_to :user
	belongs_to :movie
	has_many :party_guests, dependent: :destroy
end