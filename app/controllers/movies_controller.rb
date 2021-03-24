class MoviesController < ApplicationController
  def index
    # @user = #session[:user_id]
    if params[:form] == "top_forty"
      @top_movies = MovieService.new.movies_by_vote_average
    end
  end
end
