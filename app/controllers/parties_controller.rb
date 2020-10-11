class PartiesController < ApplicationController

  def new
    binding.pry
    @movie_title = params[:movie_title].titleize
    @movie_runtime = params[:movie_runtime]
  end

end
