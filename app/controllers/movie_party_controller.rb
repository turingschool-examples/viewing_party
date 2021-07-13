class MoviePartyController < ApplicationController

  def new
    @title = params[:title]
    @movie_length = params[:runtime]
  end

  def create
    hoast = current_user
    date_time = DateTime.parse(params[:date]+" "+params[:time])
    party = MovieParty.create({user_id: hoast.id, movie_title: params[:title], date_time: date_time, runtime: params[:duration]})
    redirect_to '/dashboard'
  end
end
