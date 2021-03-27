class PartiesController < ApplicationController
  def index
    binding.pry
  end

  def show
    @movie = Movie.create({api_id: params[:api_id]})
    @party = Party.create({movie_id: @movie.id,
                        user_id:  params[:user_id]})
    redirect_to new_party_path
  end

  def create
    binding.pry
  end

  def new
    binding.pry
    @movie = Movie.create({api_id: params[:api_id]})
    @party = Party.new({movie_id: @movie.id,
                        user_id:  params[:user_id]})
  end

end
