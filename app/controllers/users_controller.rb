class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = user_params
        user[:email] = user[:email].downcase
        new_user = User.create!(user)
        cookies.encrypted[:user_id] = new_user.id
        flash[:success] = "Welcome, #{new_user.email}!"
        redirect_to "/dashboard"
    end

    def show
      @user = User.find(cookies.encrypted[:user_id])
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end