class Movie < ApplicationRecord
  validates_presence_of :api_id, :title

  has_many :parties
end
