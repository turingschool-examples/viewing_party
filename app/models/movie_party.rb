class MovieParty < ApplicationRecord
  validates_presence_of :movie_title,
                       :duration,
                       :date,
                       :start_time,
                       :host
end
