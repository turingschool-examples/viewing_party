class Friendship < ApplicationRecord
	belongs_to :user
	belongs_to :friend, class_name: 'User'
	validates_uniqueness_of :friend, { message: "You're already friends with this person" }
end
