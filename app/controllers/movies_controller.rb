class MoviesController < ApplicationController
  def index 
    
    if params[:query] == "top rated"
      @movies = MovieService.get_top_rated
    elsif params[:search]
       @movies = [Film.new({title: "Turing is fun", vote_average: 69})]
    else 
      @movies = []
    end
  end
end 