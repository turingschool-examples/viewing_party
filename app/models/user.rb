class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :parties, dependent: :destroy

  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :password, confirmation: true

  enum role: %w{regular admin}

  def invites
    id = self.id
    PartyFriend.find_invited_parties(id)
  end

  def sanitize_email
    self.email.downcase
  end
end
