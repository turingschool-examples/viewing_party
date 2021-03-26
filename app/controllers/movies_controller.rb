class MoviesController < ApplicationController
  def index
    # @user = #session[:user_id]
    if params[:form] == 'top_forty'
      @top_movies = MovieService.new.top_forty_movies
    elsif !params[:movie_query].nil?
      movie_service = MovieService.new
      query = params[:movie_query].downcase
      @query_results = movie_service.movie_search(query)
    end
  end

  def show
    movie_service = MovieService.new
    @movie = movie_service.movie_information(params[:id])
  end
end
