class MovieParty < ApplicationRecord
  validates :movie_title, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  belongs_to :user # host
  has_many :party_users, dependent: :destroy # joins table
  has_many :users, through: :party_users, dependent: :destroy # attendees

  def find_friends(user)
    friends = []
    User.where(id: PartyUser.where(movie_party_id: self[:id]).pluck(:user_id)).each do |friend|
      if friend.username == user.username
        next
      else
        friends << friend
      end
    end
    friends
  end

  def find_host(user)
    User.where(id: self.user_id).first
  end
end
