class ViewParty < ApplicationRecord
  validates_presence_of :duration,
                        :date
end
