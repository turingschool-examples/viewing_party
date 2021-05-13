class UsersController < ApplicationController

  def show
    @user = User.find([:user_id]) if session[:user_id]
  end
end
