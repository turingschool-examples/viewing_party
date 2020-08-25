require 'google/apis/calendar_v3'

class PartiesController < ApplicationController

  def new
    @movie = Movie.details(params[:id])
    friends_ids = Friendship.where(user_id: current_user.id).pluck("friend_id")
    @friends = User.find(friends_ids)
  end

  def create
    new_party = Party.create({
          title: params[:title],
          party_date: params[:party_date],
          party_time: params[:party_time],
          attendees: params[:friend_id].values,
          user_id: current_user.id
          })
    if new_party.save
      flash[:success] = "Your party for #{params[:title]} on #{params[:party_date]} at #{params[:party_time]} was created"
      redirect_to dashboard_path
    end
  end
end
