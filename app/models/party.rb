class Party < ApplicationRecord
  validates_presence_of :user_id, :movie_id, :date, :time, :duration

  belongs_to :user
  belongs_to :movie
end
