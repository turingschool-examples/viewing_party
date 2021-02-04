class MoviesController < ApplicationController
  def index
    @films = MovieDbFacade.discover_films
  end
end
