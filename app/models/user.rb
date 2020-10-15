class User < ApplicationRecord
  has_secure_password
  validates_presence_of :password, require: true
  validates :email, uniqueness: true, presence: true
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  def invited_parties
    parties = UserParty.where(is_host: false, attendee_id: self.id)
    parties.map do |party|
      Party.find(party.party_id)
    end
  end

  def host_parties
    parties = UserParty.where(is_host: true, attendee_id: self.id)
    parties.map do |party|
      Party.find(party.party_id)
    end
  end
end
