class Authenticated::MoviesController < Authenticated::BaseController

  def index
    @movie_search = MovieFacade.top_movie_search_results(params[:movie_title])
  end

  def show
    @movie = ImdbService.movie_data(params[:id])
    @cast = ImdbService.movie_cast(params[:id])
    @reviews = ImdbService.movie_reviews(params[:id])
    # binding.pry
  end
end
