class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates :status, presence: true

  enum status: { pending: 0, accepted: 1, rejected: 2 }
end
