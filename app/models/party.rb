class Party < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :party_date
  validates_presence_of :party_time
  validates_presence_of :attendees

  belongs_to :user
end
