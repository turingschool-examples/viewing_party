class Event < ApplicationRecord
  has_many :attendees
  belongs_to :user 
end
