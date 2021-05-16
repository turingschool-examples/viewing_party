class DashboardController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    session[:user_id] = @user.id
    @user_email = params[:user_email]
  end

  def create
    if params.include?(:friend_search)
      user = User.find(params[:user_id])
      friend = params[:friend_search]
      search = User.find_by(email: "#{friend}")
      UserFriend.create!(user_id: user.id, friend_id: search.id)
      redirect_to dashboard_index_path(user_id: "#{user.id}")
    end
  end
end
