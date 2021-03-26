class PartiesController < ApplicationController
  before_action :current_user
  def new
    @movie = Movie.create(name: params[:title], duration: params[:duration])
    @party = Party.new(movie_id: @movie.id, host_id: current_user.id, duration: @movie.duration )
  end

  def create
    require "pry"; binding.pry
  end
end
