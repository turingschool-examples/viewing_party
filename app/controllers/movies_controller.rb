class MoviesController < ApplicationController
  def index
    if params['movie_title'] == ''
      flash[:error] = 'Field cannot be blank; please try again.'
      redirect_to discover_path
    elsif params['movie_title']
      @movie_search_results = MoviesFacade.search_by_movie_title(params['movie_title'])
    else
      @top_rated = MoviesFacade.top_rated
    end
  end

  def show
    @movie = Movie.new(params[:id])
  end
end
