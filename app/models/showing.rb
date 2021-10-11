class Showing < ApplicationRecord
  validates_presence_of :movie_title
  validates_presence_of :duration
  validates_presence_of :day
  validates_presence_of :start_time
end
