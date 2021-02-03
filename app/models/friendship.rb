class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates :status, presence: true

  enum status: { Pending: 0, Accepted: 1, Rejected: 2 }
end
