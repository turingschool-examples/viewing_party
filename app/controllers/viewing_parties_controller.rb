class ViewingPartiesController < ApplicationController
  # def index

  # end
  # def show

  # end

  def new
    @movie = MovieFacade.new.create_movie(params[:movie_id])
  end

  def create
    viewing_party = WatchParty.create(viewing_party_params)
    attendee = Attendee.create(watch_party: viewing_party, user: current_user, status: 0)

    params[:attendees].each do |friend_id, status|
      if status == '1'
        Attendee.create(watch_party: viewing_party, user_id: friend_id)
      end
    end
    # require "pry"; binding.pry
    redirect_to "/dashboard"
  end

  # def edit

  # end
  # def update

  # end
  # def destroy

  # end

  private

  def viewing_party_params
    params.permit(:duration, :movie, :date, :start_time, :movie_id, :user_id)
  end
end
