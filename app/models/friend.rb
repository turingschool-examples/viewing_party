class Friend < ApplicationRecord

  belongs_to :friender, class_name: 'User'
  belongs_to :friendee, class_name: 'User'

  validates_presence_of :friender, :friendee

end
