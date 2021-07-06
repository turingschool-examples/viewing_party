class Friendship < ApplicationRecord
  belongs_to :user
  has_many :users  #as :friend_id

end
