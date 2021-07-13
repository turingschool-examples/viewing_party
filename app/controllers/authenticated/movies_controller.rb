class Authenticated::MoviesController < Authenticated::BaseController
  def index
    movie_service = MovieService.new
    if params[:query].nil?
      @movies = movie_service.top_rated[:results]
    elsif params[:query].present?
      @movies = movie_service.find_by_title(params[:query])[:results]
    else
      @movies = []
    end
  end

  def show
    @movie = MovieFacade.movie_details_by_id(params[:id])
  end
end
