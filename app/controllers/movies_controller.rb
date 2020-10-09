class MoviesController < ApplicationController
  def index
    movies = MovieService.new
    if params[:title]
      @found_movies = movies.find(params[:title])
      flash[:alert] = 'Sorry, no movies were found.' if @found_movies == []
    else
      @top_40 = movies.top_40
    end
  end
end
