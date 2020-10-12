class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :movie_parties, dependent: :destroy

  def been_invited?
    !PartyUser.where(user_id: id).empty?
  end

  def find_parties
    party_ids = PartyUser.where(user_id: id).map(&:movie_party_id)
    MovieParty.where(id: party_ids)
  end
end
