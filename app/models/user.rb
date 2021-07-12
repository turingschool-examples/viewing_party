class User < ApplicationRecord
  has_many :user_friendships, dependent: :destroy
  has_many :friends, through: :user_friendships
  has_many :parties, foreign_key: :party_host_id, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password

  def invites
    Attendee.where(user_id: self.id)
            .map(&:party)
  end
end
