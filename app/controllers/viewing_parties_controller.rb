require 'google/apis/calendar_v3'

class ViewingPartiesController < ApplicationController

  def new
    @movie = Movie.details(params[:id])
    friends_ids = Friendship.where(user_id: current_user.id).pluck("friend_id")
    @friends = User.find(friends_ids)
  end

  def create
    require "pry"; binding.pry
    ViewingParty.create(party_params)
    redirect_to dashboard_path
  end

  private

  def party_params
    params.permit(:title, :party_date, :party_time)
  end
end
