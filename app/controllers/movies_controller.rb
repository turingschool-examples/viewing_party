class MoviesController < ApplicationController
  # before_action :require_current_user

  def index 
    
    if params[:query] == "top rated"
      @movies = MovieService.get_top_rated
    elsif params[:search]
       @movies = [Film.new({title: "Turing is fun", vote_average: 69, id: 550})]
      #  just a placeholder until the real endpoint can be used for search by title
    else 
      @movies = []
    end
  end

  def show 
    @details = MovieService.movie_details(params[:id])
    @cast    = MovieService.get_cast(params[:id])
    @reviews = MovieService.get_reviews(params[:id])
  end

  private 

  # def require_current_user 
  #   render file: '/public/404' unless current_user
  # end
end 