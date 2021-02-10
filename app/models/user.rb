class User < ApplicationRecord
	validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: ", you must use a valid email address" }
	validates_presence_of :password

	has_many :friendships
	has_many :friends, through: :friendships, source: :friend
	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_friendships, :source => :user
	has_many :parties
	has_many :party_guests

	has_secure_password

	before_save do
		email.downcase!
	end


end
