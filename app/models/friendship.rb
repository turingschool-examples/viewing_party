class Friendship < ApplicationRecord
  validates :followee_id, presence: true
  validates :follower_id, presence: true


  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'
end
