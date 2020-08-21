class MoviesController < ApplicationController
  def index
    @movies = MoviesService.new.top40
  end

  def show
    movie_details = MoviesService.new.film_info(params[:id])
    cast = MoviesService.new.cast(params[:id])
    reviews_info = MoviesService.new.movie_reviews(params[:id])

    @reviews = reviews_info.map{|review| FilmReview.new(review)}
    @movie = Movie.new(movie_details, cast)
  end 
end
