class MoviesController < ApplicationController

  def index
    if params[:search].present?
      @movies = MovieService.new.search(params[:search])
    else
      @movies = MovieService.new.top_40
    end
  end

  def show
  end
end
