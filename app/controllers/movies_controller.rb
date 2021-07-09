class MoviesController < ApplicationController

  def index
    @movie_search = ImdbService.top_movies_search(params[:movie_title])
  end
  
  def show
    @title = params[:title]
  end
end