class DiscoverController < ApplicationController
  def discover
    @user = current_user
  end

  def index
    if params[:search].present?
      @user = current_user
      @results = MovieInfo.new(params[:search]).search_results
    elsif params[:top_40].present?
      @user = current_user
      @popular_movies = MovieInfo.new.popular_movies
    end
  end

  def show
    @user = current_user
    @movie_details = MovieInfo.new(params[:movie_id]).movie_details
    @movie_cast = MovieInfo.new(params[:movie_id]).movie_cast_details
    @movie_reviews = MovieInfo.new(params[:movie_id]).movie_review_details
  end
end
