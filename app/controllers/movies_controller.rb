class MoviesController < ApplicationController
  def discover
  end

  def movies
    if params[:top_movies]
      @top_movies = MovieFacade.new.top_movies
    elsif params[:search]
      @search_movies = MovieService.new.movie_search(params[:search])
    end
  end

  def show
    @movie = MovieFacade.new.create_movie(params[:movie_id])
  end

  # def movie_show
  #   @movie = MovieFacade.create_movie(params[:movie_id])
  # end
end
