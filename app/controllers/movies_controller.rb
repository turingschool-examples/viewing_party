class MoviesController < ApplicationController
  def index
    @title = params[:title].gsub(' ', '%20') if params[:title]
  end

  def show
    @movie_id = params[:id]
  end

  def discover; end
end
