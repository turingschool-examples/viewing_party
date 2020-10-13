class MoviesController < ApplicationController
  before_action :require_user
  def index
    if params[:search]
      @results = SearchFacade.search_movies(params[:search], ENV['MOVIE_API_KEY'])
    else
      @results = SearchFacade.get_40_movies(40, ENV['MOVIE_API_KEY'])
    end
  end

  def show
    @movie = SearchFacade.get_specific_movie(params[:id].to_i, ENV['MOVIE_API_KEY'])
    @runtime = MovieStats.calculate_time(@movie)
    cast = SearchFacade.find_cast(params[:id].to_i, ENV['MOVIE_API_KEY'])
    @cast = if cast.length >= 10
              SearchFacade.find_cast(params[:id].to_i, ENV['MOVIE_API_KEY'])[0..9]
            else
              SearchFacade.find_cast(params[:id].to_i, ENV['MOVIE_API_KEY'])
            end
    @reviews = SearchFacade.find_reviews(params[:id].to_i, ENV['MOVIE_API_KEY'])
    @recommendations = SearchFacade.find_recommendations(params[:id].to_i, ENV['API_MOVIE_KEY'])
  end
end
