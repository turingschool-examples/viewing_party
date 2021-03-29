class MoviesController < ApplicationController
  before_action :require_current_user

  def index
    @movies = MoviesFacade.top40
  end

  def search
    @movies = MoviesFacade.movie_search(params[:find_movie])

    if @movies.empty?
      flash[:message] = 'Your search returned 0 results'
    end
    render :index
  end

  private

  def require_current_user
    render file: '/public/401' unless current_user
  end
end
