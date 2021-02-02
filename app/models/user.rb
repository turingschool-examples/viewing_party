class User < ApplicationRecord
	has_many :friendships
	has_many :friends, through: :friendships, source: :friend
	has_many :parties
end
