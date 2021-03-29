require './app/facades/movies_facade'

class MoviesController < ApplicationController
  before_action :require_current_user

  def index
    @movies = MoviesFacade.top_40
  end

  def search
    @movies = MoviesFacade.movie_search("#{params[:find_movie]}")
    render :index
  end

  private

  def require_current_user
    render file: '/public/401' unless current_user
  end
end
