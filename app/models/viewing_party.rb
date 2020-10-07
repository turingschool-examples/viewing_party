class ViewingParty < ApplicationRecord
  has_many :users

  validates :movie_title,
            :host,
            :date,
            :time


end
