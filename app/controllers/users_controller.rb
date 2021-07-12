class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
      user = user_params
      user[:email] = user[:email].downcase
      new_user = User.new(user)

      if new_user.save
        # session[:user_id] = new_user.id
        cookies.encrypted[:user_id] = new_user.id
        flash[:success] = "Account created succesfully!"
        # flash[:success] = "Welcome, #{new_user.email}!"
        redirect_to "/dashboard"

      else
        if User.find_by(email: user[:email]) != nil
          flash[:error] = "invalid email or password"
        else
          flash[:error] = new_user.errors.full_messages
        end
        redirect_to '/register'
      end
    end
    
    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
