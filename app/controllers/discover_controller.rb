class DiscoverController < ApplicationController
  def discover
    @user = current_user
  end

  def index
    if params[:search].present?
      @user = current_user
      @results = MovieFacade.search_results(params[:search])
    elsif params[:top_40].present?
      @user = current_user
      @popular_movies = MovieFacade.popular_movies
    end
  end

  def show
    @user = current_user
    @movie_details = MovieFacade.movie_details(params[:movie_id])
    @movie_cast = MovieFacade.movie_cast_details(params[:movie_id])
    @movie_reviews = MovieFacade.movie_review_details(params[:movie_id])
  end
end
