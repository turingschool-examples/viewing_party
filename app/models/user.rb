class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :parties
  has_many :guests, through: :parties
  has_secure_password

  def invited_to
    Party.joins(:guests).where("guests.user_id = ?", self.id)
  end

  def all_parties
    (self.parties) + (self.invited_to)
  end
end
