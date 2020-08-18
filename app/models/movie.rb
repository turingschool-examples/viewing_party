class Movie < ApplicationRecord
  validates_presence_of :name,
                        :duration
end
