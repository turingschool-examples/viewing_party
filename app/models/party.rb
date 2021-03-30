class Party < ApplicationRecord
  belongs_to :host, class_name: 'User'
  belongs_to :movie
  has_many :party_friends
  has_many :users, through: :party_friends

  validates :host, presence: { require: true }
  validates :movie, presence: { require: true }
  validates :date, presence: { require: true }
  validates :start_time, presence: { require: true }
  validates :duration, numericality: { greater_than_or_equal_to: :validate_duration }

  def find_movie
    movie.name
  end

  def clean_date
    date.to_formatted_s(:long_ordinal)
  end

  def clean_time
    start_time.strftime('%I:%M%p')
  end

  def validate_duration
    movie.duration
  end
end
