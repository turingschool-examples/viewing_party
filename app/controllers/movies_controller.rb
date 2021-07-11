class MoviesController < ApplicationController
  def index
    movie_service = MovieService.new
    if params[:q].nil? 
      @movies = movie_service.top_rated[:results]
    elsif params[:q].present? 
      @movies = movie_service.find_by_title(params[:q])[:results]
    else
      @movies = []
    end
  end
end