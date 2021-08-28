class ViewingPartiesController < ApplicationController
  def new
    @movie = MovieFacade.create_movie(params[:movie_id])
  end

  def create
    viewing_party = WatchParty.create(viewing_party_params)

    redirect_to :controller => 'attendees', :action => 'create', viewing_party_id: viewing_party.id, params: request.parameters
  end

  private

  def viewing_party_params
    params.permit(:duration, :movie, :date, :start_time, :movie_id, :user_id)
  end
end
