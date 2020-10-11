class MovieParty < ApplicationRecord
  validates :movie_title, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  belongs_to :user
  has_many :friends, class_name: 'User', dependent: :destroy
end
