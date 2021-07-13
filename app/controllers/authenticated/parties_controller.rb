class Authenticated::PartiesController < Authenticated::BaseController
  def new 
    @movie = MovieFacade.movie_details_by_id(params[:movie_id])
  end 

  def create 

  end
  
end