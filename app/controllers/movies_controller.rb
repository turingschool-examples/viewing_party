class MoviesController < ApplicationController
  before_action :require_user
  def index
    @results = if params[:search]
                 SearchFacade.search_movies(params[:search])
               else
                 SearchFacade.get_40_movies(40)
               end
  end

  def show
    @movie = SearchFacade.get_specific_movie(params[:id].to_i)
    @runtime = MovieStats.calculate_time(@movie)
    cast = SearchFacade.find_cast(params[:id].to_i)
    @cast = if cast.length >= 10
              SearchFacade.find_cast(params[:id].to_i)[0..9]
            else
              SearchFacade.find_cast(params[:id].to_i)
            end
    @reviews = SearchFacade.find_reviews(params[:id].to_i)
  end
end
