class MoviesController < ApplicationController
  def show
    @movie_id = params[:id]
    @service = TMDBService.new(ENV['movie_db_key'], @movie_id)

  end
end
