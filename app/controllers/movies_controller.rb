class MoviesController < ApplicationController
  def index
    if params[:form] == 'top_forty'
      @top_movies = MovieFacade.top_movies(40)
    elsif !params[:movie_query].nil?
      @query_results = MovieFacade.search((params[:movie_query].downcase), ENV['SEARCH_RESULT_COUNT'].to_i)
    end
  end

  def show
    @movie_info = MovieFacade.movie_information(params[:id])
    @movie = MovieFacade.create_movie(api_id: params[:id])
    cookies[:seivom_di] = @movie_info[:api_id]
  end
end
