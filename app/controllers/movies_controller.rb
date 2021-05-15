class MoviesController < ApplicationController
  def show
    @movie_id = params[:id]
  end
end
