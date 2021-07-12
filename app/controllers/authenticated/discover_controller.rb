class Authenticated::DiscoverController < Authenticated::BaseController

  def index
    @top_movies = MovieFacade.top_movie_results
  end
  
end