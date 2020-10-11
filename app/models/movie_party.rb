class MovieParty < ApplicationRecord
  validates :movie_title, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  belongs_to :user # host
  has_many :party_users, dependent: :destroy # joins table
  has_many :users, through: :party_users, dependent: :destroy # attendees

  def find_friends
    User.where(id: PartyUser.where(movie_party_id: self[:id]).pluck(:user_id))
  end
end
