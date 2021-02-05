class FriendshipsController < ApplicationController
	before_action :find_friend, only: [:create]

	def create
		if @friend
			@friendship = Friendship.new(user_id: Current.user.id, friend_id: @friend.id)
			if @friendship.save
				redirect_to dashboard_path, notice: "Friend added successfully."
			else
				redirect_to dashboard_path, alert: "You're already friends with this person."
			end
		else
			redirect_to dashboard_path, alert: "Invalid email."
		end
	end

	private

	def find_friend
		@friend = User.find_by(email: params[:friendship][:email])
	end

end
