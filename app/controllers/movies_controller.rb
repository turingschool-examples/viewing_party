class MoviesController < ApplicationController
  def show
    @movie = APIFacade.new(params[:id])
  end
end
