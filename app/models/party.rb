class Party < ApplicationRecord
  # alias_method :host, :user_id

  validates_presence_of :movie_title,
            :user_id,
            :date,
            :time

end
