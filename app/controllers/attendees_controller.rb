class AttendeesController < ApplicationController
  def create
    viewing_party = WatchParty.find(params[:viewing_party_id])
    attendee = Attendee.create(watch_party: viewing_party, user: current_user, status: 0)

    if params[:attendees]
      params[:attendees].each do |friend_id, status|
        if status == '1'
          Attendee.create(watch_party: viewing_party, user_id: friend_id)
        end
      end
    end

    redirect_to "/dashboard"
  end
end
