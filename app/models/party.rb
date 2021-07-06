class Party < ApplicationRecord

  validates :host, presence: true
  validates :movie_id, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :movie_title, presence: true
  validates :duration, presence: true

  belongs_to :user, foreign_key: 'host'
end
