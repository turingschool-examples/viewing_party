class UserFriendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
end
