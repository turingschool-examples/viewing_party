class MoviesController < ApplicationController
  def show
    @movie = Movie.new(params[:id])
  end
end
