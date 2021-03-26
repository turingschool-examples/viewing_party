class PartyController < ApplicationController
  before_action :current_user
  def new
    @movie = Movie.create(name: params[:title], duration: params[:runtime])
    @party = Party.new(movie_id: @movie.id, host_id: @current_user.id, duration: @movie.duration )
    # binding.pry
  end
end
