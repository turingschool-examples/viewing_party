class Movie < ApplicationRecord
  validates_presence_of :name,
                        :duration
  belongs_to :view_party
end
