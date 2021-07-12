class MoviesController < ApplicationController
  def index
    movie_service = MovieService.new
    if params[:query].nil?
      @movies = movie_service.top_rated[:results]
    elsif params[:query].present?
      @movies = movie_service.find_by_title(params[:query])[:results]
    else
      @movies = []
    end
  end

  def show
    movie_service = MovieService.new
    movie = movie_service.find_by_id(params[:id])
    cast = movie_service.find_cast(params[:id])
    reviews = movie_service.find_reviews(params[:id])

    @movie = MovieDetails.new(movie, cast, reviews)
  end
end
