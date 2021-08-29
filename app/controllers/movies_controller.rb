class MoviesController < ApplicationController
  def index
    if params['result'] == 'top_40'
      @results = MovieServices.top_forty
    else
      @results = api_movies_search(search_params[:keywords])
    end
  end

  def show
  end

  private

  def search_params
    params.permit(:keywords)
  end

  def api_movies_search(keywords)
    json = MovieServices.new.search(keywords)
    Search.new.first_40_results(json)
  end
end
