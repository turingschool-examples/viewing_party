class MoviesController < ApplicationController
  def index
    if params[:search_query] == "top_40"
      movie_service.get_top_rated_movies
    else 
      movie_service.search(params[:search_query])
    end
  end 
end
