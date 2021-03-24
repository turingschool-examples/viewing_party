class MoviesController < ApplicationController
  def index
    # @user = #session[:user_id]
    if params[:form] == "top_forty"
      @top_movies = MovieService.new.movies_by_vote_average
    elsif params[:movie_query] != nil
      movie_service = MovieService.new
      query = params[:movie_query].downcase
      @query_results = movie_service.movie_search(query)
    end
  end
end
