class MoviesController < ApplicationController
  def index

    if params[:query] == "top rated"
      @movies = MovieService.get_top_rated
    elsif params[:search]
       title = params[:search]
       @movies = MovieService.make_searched_movies(title)
    else
      @movies = []
    end
  end
end
