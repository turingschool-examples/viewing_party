class Friendship < ApplicationRecord
	belongs_to :user
	belongs_to :friend, class_name: 'User'

	validate :users_are_not_already_friends?

	def users_are_not_already_friends?
		if friend == user
			self.errors.add(:user_id, 'You Cannot Add Yourself')
		else
			if user.all_friends.include?(friend)
				self.errors.add(:user_id, "You're already friends with this person.")
			end
		end
	end

end
