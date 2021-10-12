class Party < ApplicationRecord
  validates_presence_of :movie_title
  validates_presence_of :duration
  validates_presence_of :time
  validates_presence_of :date
end
