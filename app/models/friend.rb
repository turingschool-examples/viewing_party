class Friend < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validate :cannot_add_self

  private

  def cannot_add_self
    errors.add(:followed_id, 'You cannot add yourself as a friend.') if follower_id == followed_id
  end
end
