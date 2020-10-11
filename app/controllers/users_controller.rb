class UsersController < ApplicationController
  def new; end

  def show
    @user = current_user
    return unless @user.movie_parties.empty?

    @movie_parties = current_user.movie_parties
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/dashboard'
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
