class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, presence: true
  validates :password, confirmation: { case_sensitive: true }
  has_many :friendships
  has_many :attendees
  has_many :watch_parties
  has_many :watch_parties, through: :attendees

  has_secure_password

  def friends
    chums = self.friendships.map {|chum| chum.friend_id}
    User.where(id: chums)
  end
end
