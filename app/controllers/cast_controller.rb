class CastController < ApplicationController

  def show
    @person = MovieService.person_info(params[:id])
    @results = MovieService.movies_by_cast_id(params[:id], 40)
  end
end
