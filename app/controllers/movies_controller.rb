class MoviesController < ApplicationController
  def index
    @results = api_movies_search(search_params[:keywords])
  end

  def show
  end

  private

  def search_params
    params.permit(:keywords)
  end

  def api_movies_search(keywords)
    json = MovieService.new.search(keywords)
    Search.new.first_40_results(json)
  end
end
