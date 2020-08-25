class ViewingPartiesController < ApplicationController
  def new
    @movie = MovieFacade.new(params[:movie_id])
  end

  def create
    require "pry"; binding.pry
    #have
    #current_user, poster, duration, auth token, movie title, datetime(schema date string), friend_ids
    ViewingParties.new
  end
end
