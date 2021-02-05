class User < ApplicationRecord
	has_many :friendships
	has_many :friends, through: :friendships, source: :friend
	has_many :parties

	has_secure_password

	validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: ", you must use a valid email address" }
	validates_presence_of :password

	before_save do
		email.downcase!
	end

	def add_friend(friend)
		Friendship.create(user_id: self.id, friend_id: friend.id)
		Friendship.create(user_id: friend.id, friend_id: self.id)
	end
end
