class PartiesController < ApplicationController
  def new
    @user = current_user

    @movie = MovieFacade.movie_info_by_id(params[:movie_id])
  end

  def create
  end
end
