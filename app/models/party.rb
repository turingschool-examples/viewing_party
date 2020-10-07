class Party < ApplicationRecord
  has_many :users

  validates_presence_of :movie_title,
            :user_id,
            :date,
            :time

end
