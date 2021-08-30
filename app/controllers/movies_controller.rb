class MoviesController < ApplicationController
  def index
    if params['result'] == 'top_40'
      @results = MovieServices.new.top_forty
    else
      @results = MovieFacade.movies_search(search_params[:keywords])
    end
  end

  def show
  end

  private

  def search_params
    params.permit(:keywords)
  end
end
