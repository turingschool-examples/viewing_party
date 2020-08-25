class ViewPartiesController < ApplicationController
  def new
    @movie = MovieFacade.new(params[:movie_id])
  end

  def create
    party = ViewParty.create(title: params[:title], duration: params[:duration], date: params[:date], time: params[:time], poster: params[:poster], user_id: current_user.id)
    PartyGuest.create_invites(party.id, params[:viewing_party][:friend_ids])
    #create party class method for user parties send it an array from the check boxes
    # also create guest joins here
  end
  # private
  # def viewing_party_params
  #   params.permit(:title, :duration, :date, :time, :poster)
  # end
end
