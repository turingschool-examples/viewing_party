class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome #{@user.email}! Thank you for registering!"
        session[:current_user] = @user.id
        redirect_to "/dashboard"
      else
        flash[:error] = @user.errors.full_messages.to_sentence
        @user.email = "" if @user.errors.details.keys.include?(:email)
        render :new
      end
    end

    def show
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  
  end
  