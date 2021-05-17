class DashboardController < ApplicationController
  def index
    if params.include?(params[:user_id])
      #currently user_id is only being passed after registration
      @user = User.find_by(email: "#{params[:user_email]}")
      session[:user_id] = @user.id
      @user_email = @user.email
    else
      #i need to pass user_id in the login form somehow, but
      #i do not have @user to get from
      @user = User.find(params[:user_id])
      session[:user_id] = @user.id
      @user_email = params[:user_email]
    end
  end

  def create
    if params.include?(:friend_search)
      user = User.find(params[:user_id])
      friend = params[:friend_search]
      # binding.pry
      if User.find_by(email: "#{friend}").nil?
        flash[:error] = "I'm sorry your frined cannot be found"
        redirect_to dashboard_index_path(user_id: "#{user.id}")
      else
        search = User.find_by(email: "#{friend}")
        UserFriend.create!(user_id: user.id, friend_id: search.id)
        redirect_to dashboard_index_path(user_id: "#{user.id}")
      end
    end
  end
end
