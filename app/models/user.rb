class User < ApplicationRecord
  validates_presence_of :name,
                        :email,
                        :user_name
  has_many :view_parties
  has_many :view_parties, through: :view_party_attendees
  has_many :view_party_attendees
end
