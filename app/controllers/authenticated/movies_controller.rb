class Authenticated::MoviesController < Authenticated::BaseController
  def index
    movie_service = MovieService.new
    if params[:query].nil?
      @movies = MovieFacade.forty_top_rated_movies
    elsif params[:query].present?
      @movies = MovieFacade.search_movie_title(params[:query])
    else
      @movies = []
    end
  end

  def show
    @movie = MovieFacade.movie_details_by_id(params[:movie_id])
  end

  def discover
    @user = current_user
  end
end
