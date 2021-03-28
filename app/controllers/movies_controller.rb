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
    if Movie.exists?(api_id: params[:id])
      @movie = Movie.find_by(api_id: params[:id])
      @movie_info = movie_service.movie_information(params[:id])
    else
      @movie = Movie.create({api_id: params[:id]})
      @movie_info = movie_service.movie_information(@movie.api_id)
    end
  end
end
