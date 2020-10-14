class PartyController < ApplicationController
  def new
    @movie = MovieDataBaseFacade.movie_details(params[:id])
  end

  def create
    party = Party.create(party_params)
    invited_friends = params[:users][:id]
    invited_friends.each do |friend_id|
      UserParty.create(party_id: party.id, attendee_id: friend_id )
    end
    redirect_to user_dashboard_path
  end

  private

  def party_params
    params.permit(:title, :duration, :date, :time)
  end
end
