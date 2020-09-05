class MoviesController < ApplicationController
  def index
    @keyword = params[:keyword]
    @movies = MovieFacade.new(@keyword)
  end

  def show
    id = params[:id]
    @movie = MovieFacade.new.movie_result(id)
    @reviews = MovieFacade.new.movie_reviews(id)
  end
end
