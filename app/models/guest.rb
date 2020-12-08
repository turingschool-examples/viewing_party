class Guest < ApplicationRecord
  belongs_to :party
  has_many :users
end
