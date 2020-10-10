class MovieParty < ApplicationRecord
  validates_presence_of :movie_title,
                       :duration,
                       :date,
                       :start_time
  belongs_to :user
  has_many :party_users
  has_many :users, through: :party_users
end
