class MoviesController < ApplicationController
  def index
    if params['movie_title'] == ''
      flash[:error] = 'Search field cannot be blank.'
      redirect_to discover_path
    elsif params['movie_title']
      @search_results = MovieFacade.search_by_title(params['movie_title'])
    else
      @top40 = MovieFacade.top40
    end
  end

  def show
    @movie = MovieFacade.fetch_movie_details(params['id'])
    @cast_members = MovieFacade.fetch_movie_cast(params['id'])
    @reviews = MovieFacade.fetch_movie_reviews(params['id'])
    @similar_movies = MovieFacade.fetch_similar_movies(params['id'])
  end
end
