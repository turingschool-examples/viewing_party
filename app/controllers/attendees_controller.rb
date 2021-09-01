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

    send_mail(viewing_party)
    redirect_to "/dashboard"
  end

  private

  def send_mail(viewing_party)
    WatchPartyMailer.viewing_party_invitation(viewing_party).deliver
  end
end
