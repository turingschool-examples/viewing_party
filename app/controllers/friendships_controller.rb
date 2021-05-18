class FriendshipsController < ApplicationController
  def create
    @user = current_user
    friend = User.find_by(user_name: params[:search])
    @user.friends << friend
    flash[:notice] = 'You made a friend!'
    binding.pry
    redirect_to dashboard_path
  end

  def self.search(search_params)
    where("user_name ILIKE ?", "%#{search_params}%")
  end
end
