class Party < ApplicationRecord
  validates :movie_title, presence: true
  validates :party_duration, presence: true, numericality: true
  validates :party_date, presence: true
  validates :start_time, presence: true
  validates :user_id, presence: true, numericality: true
  validates :runtime, presence: true, numericality: true
  validates :party_duration, numericality: { greater_than_or_equal_to: :runtime }

  has_many :user_parties
  has_many :users, through: :user_parties # friends/guests
  # belongs_to :user # host

  def host_name
    id = self.user_id
    User.find(id).user_name
  end
end
