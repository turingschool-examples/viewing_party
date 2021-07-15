class PartyController < ApplicationController
  def new
    @user = User.find(session[:user_id])
    @movie = Movie.new(params[:movie_id])
  end

  def create
    @user = User.find(session[:user_id])
    @movie = Movie.new(params[:movie_id])
    date = "#{params['date(2i)']} #{params['date(3i)']}, #{params['date(1i)']}"

    if !@user.nil? && params[:duration].to_i >= @movie.runtime_in_minutes
      Party.create!(party_host_id: @user.id, movie_title: params[:title], movie_id: params[:movie_id], date: date, duration: params[:duration], start_time: params[:start_time])
      redirect_to '/dashboard'
    else
      flash[:error] = 'One or more of your fields is incorrect'
      render :new
    end
  end
end
