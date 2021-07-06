class Party < ApplicationRecord
  validates :start_time_day, presence: true
  validates :movie_api_id, :duration, presence: true, numericality: true

  belongs_to :user  #as :host_id
  has_many :party_guests
  has_many :users, through: :party_guests

end

  # has_one :host_id
  # has_many :invoices, dependent: :destroy
  # validates_presence_of :name
