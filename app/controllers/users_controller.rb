class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @friends = @user.friends
  end
end
