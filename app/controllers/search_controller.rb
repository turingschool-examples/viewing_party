class SearchController < ApplicationController
  def index
    @movies = MoviesFacade.find_movies_by_name(params[:query])
  end
end
