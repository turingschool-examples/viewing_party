class MoviesController < ApplicationController
  def discover
  end

  def index
    if params[:top_movies]
      @top_movies = MovieService.new.top_movies
    elsif params[:search]
      @search_movies = MovieService.new.movie_search(params[:search])
    end
  end

  def show
    @movie = MovieFacade.create_movie(params[:movie_id])
  end

  def create
    movie = MovieFacade.create_movie(params[:movie_id])
    if session[:movies].nil?
      session[:movies] = []
      session[:movies] << {title: movie.title, movie_id: params[:movie_id]}
    else
      session[:movies] << {title: movie.title, movie_id: params[:movie_id]} unless session[:movies].any? { |hash| hash.value?(params[:movie_id])}
    end
    redirect_to "/movies/#{params[:movie_id]}"
  end
end
