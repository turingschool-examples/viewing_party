class Movie < ApplicationRecord
  has_many :parties

  validates :name, presence: true
  validates :duration, presence: true
end
