class MoviesController < ApplicationController
  def index
    if params[:search]
      @films = MovieDbFacade.search_films(params[:search])
    else
      @films = []
      @films << MovieDbFacade.discover_films(1)
      @films << MovieDbFacade.discover_films(2)
    end.flatten!
  end
end
