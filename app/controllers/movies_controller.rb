class MoviesController < ApplicationController
  def index
    if params[:form] == 'top_forty'
      @top_movies = MovieService.top_forty_movies
    elsif !params[:movie_query].nil?
      @query_results = MovieFacade.search((params[:movie_query].downcase), ENV['SEARCH_RESULT_COUNT'].to_i)
    end
  end

  def show
    @movie_info = MovieService.movie_information(params[:id])
    # cookies[:movie_title] = @movie_info[:title]
    # cookies[:duration] = @movie_info[:runtime]
    cookies[:seivom_di] = @movie_info[:api_id]

    if Movie.exists?(api_id: params[:id])
      @movie = Movie.find_by(api_id: params[:id])
    else
      @movie = Movie.create({api_id: params[:id]})
    end
  end
end
