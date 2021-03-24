class Party < ApplicationRecord
  belongs_to :host, class_name: 'User'
  belongs_to :movie
  has_many :party_friends
  has_many :users, through: :party_friends

  validates :host, presence: { require: true }
  validates :movie, presence: { require: true }
  validates :date, presence: { require: true }
  validates :start_time, presence: { require: true }
end
