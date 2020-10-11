class UsersController < ApplicationController
  def new; end

  def show
    @user = current_user
    if !current_user.movie_parties.empty?
      @movie_parties = current_user.movie_parties
      # @date = Movie.new.convert_date(current_user.movie_parties.first[:date])
      # @time = Movie.new.convert_time(current_user.movie_parties.first[:start_time])
    end
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
