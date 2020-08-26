class ViewPartiesController < ApplicationController
  def new
    @movie = MovieFacade.new(params[:movie_id])
  end

  def create
    party = current_user.view_parties.create(view_party_params)
    PartyGuest.create_invites(party.id, params[:viewing_party][:friend_ids])
    redirect_to dashboard_path
  end

  private

  def view_party_params
    params.permit(:title, :duration, :date, :time, :poster)
  end
end
