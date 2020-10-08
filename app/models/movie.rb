class Movie < ApplicationRecord
  validates_presence_of :title, require: true
  validates_presence_of :api_id, require: true
end
