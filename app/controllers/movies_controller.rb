class MoviesController < ApplicationController
  def index
    @top_40_movies = MovieService.get_top_rated_movies
    #refactor this into a facade later
  end

  def show
    #Jahara info, we need to make a poro/facade to call something such as
    #@movie = MoviesFacade.get_movie_details(params[:id])
    #session[:movie] = { api_id: @movie[:id],
                        # title: @movie[:original_title],
                        # duration: @movie[:length]
                        #but even before this, i think we need to make a poro
                        #for the movie so we can just call things like
                        #@movie.id for the above hash
  end

  def movies_params
    params.require(:movie).permit(:search_query, :search_text)
  end
end
