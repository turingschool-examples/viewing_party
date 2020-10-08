class MoviesController < ApplicationController
  def index
    movies = MovieService.new
    if params[:title]
      #find the movie by the title while only providing the movie_id to the api
    else
      @top_20 = movies.top_40_first_half[:results]
      @second_top_20 = movies.top_40_second_half[:results]
    end
  end
end

#MovieService class is needed to reference it's methods and get data
#I put the MovieService class into this file as a workaround until
#I figured out how to reference it within this file
