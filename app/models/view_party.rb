class ViewParty < ApplicationRecord
  validates_presence_of :duration
  validates_presence_of :date
end
