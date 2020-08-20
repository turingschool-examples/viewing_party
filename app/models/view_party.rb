class ViewParty < ApplicationRecord
  validates :duration, presence: true
  validates :date, presence: true

  belongs_to :host, class_name: "User"
  has_many :view_party_attendees
  has_many :users, through: :view_party_attendees
end
