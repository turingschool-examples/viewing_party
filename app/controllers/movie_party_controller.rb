class MoviePartyController < ApplicationController
  def new
    @movie = Movie.new.get_specific_movie(params[:id].to_i)
    @duration = Movie.new.calculate_time(@movie)
  end
end
