require 'google/api_client/client_secrets.rb'
require 'google/apis/calendar_v3'

class GoogleCalendarService
  def add_to_calendar(user, view_party)
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = calendar_secret(user).to_authorization
    service.authorization.refresh!

    event = Google::Apis::CalendarV3::Event.new(
      summary: "Viewing party for #{view_party.title}",
      description: 'BYOB!',
      start: Google::Apis::CalendarV3::EventDateTime.new(date: view_party.date),
      end: Google::Apis::CalendarV3::EventDateTime.new(date: view_party.date)
    )

    service.insert_event('primary', event)
  end

  private

  def calendar_secret(user)
    Google::APIClient::ClientSecrets.new(
      { 'web':
        { 'access_token': user.access_token,
          'refresh_token': user.refresh_token,
          'client_id': ENV['GOOGLE_CLIENT_ID'],
          'client_secret': ENV['GOOGLE_CLIENT_SECRET'] } }
    )
  end
end
