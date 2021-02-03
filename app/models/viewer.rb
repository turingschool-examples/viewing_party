class Viewer < ApplicationRecord
  validates :status, presence: true
  validates :party, presence: true
  validates :user, presence: true
  belongs_to :party
  belongs_to :user
end
