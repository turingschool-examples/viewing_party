class PartyController < ApplicationController
  def new
    @movie = MovieDataBaseFacade.movie_details(params[:id])
  end

  def create
    party = Party.create(party_params)
    invited_friends = params[:users]
    if !invited_friends.nil?
      invited_friends[:id].each do |friend_id|
        UserParty.create(party_id: party.id, attendee_id: friend_id )
      end
      UserParty.create(party_id: party.id, attendee_id: current_user.id, is_host: true)
      redirect_to user_dashboard_path
    else
      flash[:notice] = "Friends must be selected to start a party"
      redirect_to request.referrer
    end
  end

  private

  def party_params
    params.permit(:title, :duration, :date, :time)
  end
end
