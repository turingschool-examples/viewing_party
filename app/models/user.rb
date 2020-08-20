class User < ApplicationRecord
  validates_presence_of :name,
                        :email,
                        :uid
  has_many :view_parties
  has_many :view_parties, through: :view_party_attendees
  has_many :view_party_attendees
  has_many :friends, through: :friendships
  has_many :friendships
end
