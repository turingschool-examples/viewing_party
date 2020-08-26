class Party < ApplicationRecord
  validates :title, presence: 'value'
  validates :party_date, presence: 'value'
  validates :party_time, presence: 'value'
  validates :attendees, presence: 'value'

  belongs_to :user
end
