class MoviesController < ApplicationController
  def index
    if params[:search].present?
      @films = MovieDbFacade.search_films(params[:search])
    else
      @films = []
      @films << MovieDbFacade.discover_films(1)
      @films << MovieDbFacade.discover_films(2)
    end.flatten!
  end

  def show
    movie_id = Movie.find_by_id(params[:id]).mdb_id
    @movie = MovieDbFacade.get_movie_info(movie_id)
  end

end
