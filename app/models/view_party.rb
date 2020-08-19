class ViewParty < ApplicationRecord
  validates_presence_of :duration,
                        :date
  belongs_to :host, class_name: "User"
  has_many :view_party_attendees
  has_many :users, through: :view_party_attendees
end
