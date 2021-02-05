class FriendshipsController < ApplicationController
	before_action :find_friend, only: [:create]

	def create
		if @friend && Friendship.find_by(friend_id: @friend.id)
			flash[:notice] = "You're already friends."
		elsif @friend
			Current.user.add_friend(@friend)
			flash[:notice] = "Friend added successfully."
		else
			flash[:alert] = "Friend not found."
		end
		redirect_to dashboard_path
	end

	private

	def find_friend
		@friend = User.find_by(email: params[:email])
	end

end
