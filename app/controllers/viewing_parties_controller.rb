class ViewingPartiesController < ApplicationController
  # def index

  # end
  # def show

  # end

  def new
    @movie = MovieFacade.new.create_movie(params[:movie_id])
  end

  def create
    require "pry"; binding.pry
    redirect_to "/dashboard"
  end

  # def edit

  # end
  # def update

  # end
  # def destroy

  # end

  # private
  # def _params
  #   params.permit(:)
  # end
end
