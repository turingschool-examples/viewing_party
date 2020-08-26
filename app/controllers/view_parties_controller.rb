class ViewPartiesController < ApplicationController
  def new
    @movie = MovieFacade.new(params[:movie_id])
  end

  def create
    party = ViewParty.create(title: params[:title], duration: params[:duration], date: params[:date], time: params[:time], poster: params[:poster], user_id: current_user.id)
    PartyGuest.create_invites(party.id, params[:viewing_party][:friend_ids])

    redirect_to dashboard_path
  end
end
