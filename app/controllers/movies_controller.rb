class MoviesController < ApplicationController
  def index
    if params['movie_title'] == ''
      flash[:error] = 'Field cannot be blank; please try again.'
      redirect_to discover_path
    elsif params['movie_title']
      @search_results = MoviesFacade.search_by_title(params['movie_title'])
    else
      @top_rate
    end
  end

  def show
    @movie = Movie.new(params[:id])
  end
end
