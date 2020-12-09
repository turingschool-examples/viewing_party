class Guest < ApplicationRecord
  belongs_to :party
  belongs_to :user
  # belongs_to :friendships, class_name: "User"
end
