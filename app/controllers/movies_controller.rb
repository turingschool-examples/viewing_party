class MoviesController < ApplicationController
  def index
    block_public_access
    if params[:search].present?
      @films = MovieDbFacade.search_films(params[:search])
    else
      @films = MovieDbFacade.discover_films
    end
  end

  def show
    movie_id = Movie.find_by(id: params[:id]).mdb_id
    @movie = MovieDbFacade.get_movie_info(movie_id)
  end
end
