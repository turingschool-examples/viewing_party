class MoviesController < ApplicationController
  def index
    @movies = MovieService.movie_search(params[:search])
  end

  def show

  end

  def top_40

  end
end
