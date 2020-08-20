class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :uid, presence: true

  has_many :view_parties, dependent: :destroy
  has_many :view_parties, through: :view_party_attendees
  has_many :view_party_attendees, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :friendships, dependent: :destroy
end
