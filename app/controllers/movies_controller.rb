class MoviesController < ApplicationController
  def index
      @movies = MoviesFacade.find_movies_by_name(params[:query])
  end

  # def find_top_movie_titles
  #   MoviesFacade.get_top_movies
  # end
  #
  # def find_top_movie_vote_average
  #   MoviesFacade.find_top_movie_vote_average
  # end

  # def find_movies_by_name(search)
  #   MoviesFacade.find_movies_by_name(search)
  # end

  # def find_vote_average_by_name(search)
  #   MoviesFacade.find_vote_average_by_name(search)
  # end
end
