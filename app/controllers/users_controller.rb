class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @friends = @user.friends
    @parties = Party.where(user_id: current_user.id)
  end
end
