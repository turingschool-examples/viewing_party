class UsersController < ApplicationController
  before_action require: :user, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.email}! Thank you for registering!"
      session[:current_user] = @user.id
      redirect_to '/dashboard'
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      @user.email = '' if @user.errors.details.keys.include?(:email)
      render :new
    end
  end

  def login
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      flash[:success] = "Now logged in as #{@user.email}!"
      session[:current_user] = @user.id
      redirect_to '/dashboard'
    else
      flash[:error] = 'That email/password combination does not exist in our records'
      redirect_to '/'
    end
  end

  def show
    @user = User.find(session[:current_user])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
