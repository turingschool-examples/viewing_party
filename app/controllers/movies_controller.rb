class MoviesController < ApplicationController
  def index
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
    @movie_info = movie_service.movie_information(params[:id])
    # cookies[:movie_title] = @movie_info[:title]
    # cookies[:duration] = @movie_info[:runtime]
    cookies[:api_id] = @movie_info[:api_id]

    if Movie.exists?(api_id: params[:id])
      @movie = Movie.find_by(api_id: params[:id])
    else
      @movie = Movie.create({api_id: params[:id]})
    end
  end
end
