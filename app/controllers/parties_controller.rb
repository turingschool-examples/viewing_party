class PartiesController < ApplicationController
  before_action :current_user
  def new
    @movie = Movie.create(name: params[:title], duration: params[:duration])
    @party = Party.new(movie_id: @movie.id, host_id: current_user.id, duration: @movie.duration )
  end

  def create
    @party = Party.create(party_params)
    @party_friend = PartyFriend.create(party_id: @party.id,
                                      user_id: params[:party][:friend_check][0])
    binding.pry
  end

  private

  def party_params
    params.require(:party).permit(:duration, :date, :start_time, :movie_id, :host_id)
  end
end
