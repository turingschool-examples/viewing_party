class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password

  has_many :parties, dependent: :destroy
  has_many :party_viewers, through: :parties
  has_many :user_friends, dependent: :destroy
  has_many :friends, through: :user_friends

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password_confirmation, presence: true

  def invites
    id = self.id
    Party.joins(:party_viewers).where(party_viewers: { viewer_id: id })
  end

  def hosting
    #find all the party ids(partyviewer) where the host id (parties) is = current_user.id
    Party.joins(:party_viewers)
    .where('viewer_id = "#{current_user[:id]}"')
  end
end
