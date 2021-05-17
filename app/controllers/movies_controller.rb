class MoviesController < ApplicationController
  def index
    # @movie_list = MovieService.get_top_rated_movies
    #refactor this into a facade later 


    @movie_list = if params[:search_text].present?
                    MovieService.list_movies_by_keyword
                    require 'pry'; binding.pry
                  else
                    MovieService.get_top_rated_movies
                  end
  end

  def show
    require 'pry'; binding.pry
    #Jahara info, we need to make a poro/facade to call something such as
    #@movie = MoviesFacade.get_movie_details(params[:id])
    #session[:movie] = { api_id: @movie[:id],
                        # title: @movie[:original_title],
                        # duration: @movie[:length]
                        #but even before this, i think we need to make a poro
                        #for the movie so we can just call things like
                        #@movie.id for the above hash
  end

  private
  def movies_params
    params.require(:movie).permit(:search_query, :search_text, :id)
  end
end
