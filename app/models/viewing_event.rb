class ViewingEvent < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :viewers
  has_many :users, through: :viewers

  validate :start_date_cant_be_in_the_past

  def start_date_cant_be_in_the_past
    errors.add(:start_date, "can't be in the past") if start_date < Time.now
  end

  # def duration_cant_be_less_than_movie_runtime
  #   errors.add(:duration, "duration can't be less than movie runtime") if runtime < Time.now
  # end
end
