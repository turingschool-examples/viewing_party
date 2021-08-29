class ViewingPartiesController < ApplicationController
  def new
    @movie = MovieFacade.create_movie(params[:movie_id])
  end

  def create
    viewing_party = WatchParty.create(viewing_party_params)
    if viewing_party.save
      redirect_to :controller => 'attendees', :action => 'create', viewing_party_id: viewing_party.id, params: request.parameters
    else
      flash[:alert] = "Form missing details"
      redirect_to "/viewing-parties/new", params: request.parameters
    end

  end

  private

  def viewing_party_params
    params.permit(:duration, :movie, :date, :start_time, :movie_id, :user_id)
  end
end
