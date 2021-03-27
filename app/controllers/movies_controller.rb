class MoviesController < ApplicationController
  before_action :require_current_user

  def index
    @movies = FilmSearch.new.top_40_films
    @user = current_user
  end

  def search
    @user = current_user
    @movies = FilmSearch.new.movie_searched("#{params[:find_movie]}")
    render :index
  end

  private

  def require_current_user
    render file: '/public/401' unless current_user
  end
end
