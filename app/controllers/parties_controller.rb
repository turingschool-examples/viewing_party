class PartiesController < ApplicationController
  def new
    @user = current_user

    @movie = MovieFacade.movie_info_by_id(:movie_id)
  end
end
