class MoviesController < ApplicationController
  def index
    if params[:search_query] == "top_40"
      MovieService.get_top_rated_movies
    else 
      MovieService.search(params[:search_query])
    end
  end
  
  def show
    x = MovieService.conn
    require 'pry'; binding.pry
  end
end
