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
    User.where(id: PartyUser.where(movie_party_id: id).pluck(:user_id)).find_each do |friend|
      next if friend.username == user.username

      friends << friend
    end
    friends
  end

  def find_host
    User.find_by(id: user_id)
  end
end
