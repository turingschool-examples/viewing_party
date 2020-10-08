class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true, presence: true
    validates_presence_of :password, require: true
    has_many :friendships
    has_many :friends, through: :friendships
    def add_friend(new_friend)
        friends << new_friend
        new_friend.friends << self
    end
end
