class Party < ApplicationRecord
  validates :movie, presence: true
  validates :start_time, presence: true

  belongs_to :movie
  has_many :viewers, dependent: :destroy
end
