class MoviesController < ApplicationController
  before_action :require_user
  def index
    @results = if params[:search]
                 MoviesFacade.search_movies(params[:search])
               elsif params[:popular]
                 MoviesFacade.get_current_popular(40)
               else
                 MoviesFacade.get_list_movies(40)
               end
  end

  def show
    @movie_info = MoviesFacade.get_info(params[:id].to_i)
  end
end
