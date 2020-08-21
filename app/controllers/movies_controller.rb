class MoviesController < ApplicationController
  def index
    @movies = MoviesService.new.top40
  end
end
