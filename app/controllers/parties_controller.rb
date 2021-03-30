class PartiesController < ApplicationController
  def new
    @party = Party.new
    @movie = MovieService.movie_details(params[:movie_id])
  end

  def create

  end
end