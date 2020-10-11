class PartiesController < ApplicationController

  def new
    @movie_title = params[:movie_title].titleize
  end

end
