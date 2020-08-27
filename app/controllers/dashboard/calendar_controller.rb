require 'google/apis/calendar_v3'
require 'google/api_client/client_secrets.rb'

class Dashboard::CalendarController < Dashboard::BaseController
  def create
    party = ViewParty.find(params[:party])
    client = CalendarService.new.create_google_client(current_user)
    event = CalendarService.new.create_event(party, current_user)
    client.insert_event('primary', event)
    current_user.rsvp(party)
    flash[:success] = 'Party was added to Google Calendar'
    redirect_to '/dashboard'
  end
end
