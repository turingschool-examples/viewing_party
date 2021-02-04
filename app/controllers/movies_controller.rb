class MoviesController < ApplicationController
  def index
    @films = MovieDbFacade.get_films
  end
end
