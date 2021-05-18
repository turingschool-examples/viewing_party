class MoviesController < ApplicationController
  def index
    @movie_list = if params[:search_text].present?
                    MovieService.list_movies_by_keyword(params[:search_text])
                  else
                    MovieService.get_top_rated_movies
                  end
  end

  def show
    @movie = MovieService.return_single_movie(params[:id])
  end

  def movies_params
    params.require(:movie).permit(:search_query, :search_text)
  end
end
