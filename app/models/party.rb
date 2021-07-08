class Party < ApplicationRecord
  has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations

  validates_presence_of :movie_id, :title, :duration, :date, :start_time
end
