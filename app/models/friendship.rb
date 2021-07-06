class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: :User # as :friend_id
 end
