class PartyController < ApplicationController
  def new
    binding.pry
    @user = User.find(session[:user_id])
    @movie = Movie.new(params[:movie_id])
  end

  def create
    @user = user.find(session[:user_id])
    @movie = Movie.new(params[:movie_id])
    #runtime
    #movie name
  end
end
