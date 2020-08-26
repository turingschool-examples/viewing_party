require 'date'

class Dashboard::ViewingPartiesController < Dashboard::BaseController
  def new
    title = params[:title]
    runtime = params[:runtime]
    @movie_details = ViewPartyMovie.new(title, runtime)
  end

  def create
    friends = User.where(id: params[:user][:friends])
    @party = current_user.view_parties.create(date: params[:date], time: params[:start_time], movie_title: params[:title], runtime: params[:runtime])
    friends.each do |friend|
      @party.users << friend
    end
    # add happy/sad paths
    client = create_google_client
    event = create_event(@party)
    client.insert_event('primary', event)
    flash[:notice] = 'Party was successfully scheduled.'
    redirect_to '/dashboard'
  end

  def create_google_client
    client = Google::Apis::CalendarV3::CalendarService.new
    # return unless (current_user.present? && current_user.access_token.present? && current_user.refresh_token.present?)
    secrets = Google::APIClient::ClientSecrets.new({
      "web" => {
        "access_token" => current_user.access_token,
        "refresh_token" => current_user.refresh_token,
        "client_id" => ENV["GOOGLE_API_KEY"],
        "client_secret" => ENV["GOOGLE_API_SECRET"]
      }
    })
    begin
      client.authorization = secrets.to_authorization
      client.authorization.grant_type = "refresh_token"

      if !current_user.present?
        client.authorization.refresh!
        current_user.update_attributes(
          access_token: client.authorization.access_token,
          refresh_token: client.authorization.refresh_token,
          expires_at: client.authorization.expires_at.to_i
        )
      end
    rescue
      flash[:error] = 'Your token has been expired. Please login again with google.'
      redirect_to '/'
    end
    client
  end

  private

  def create_event(view_party)
    # attendees = task[:members].split(',').map{ |t| {email: t.strip} }
    attendees = view_party.users.map do |friend|
      {email: friend.email}
    end
    event = Google::Apis::CalendarV3::Event.new({
      summary: view_party[:movie_title],
      # location: '800 Howard St., San Francisco, CA 94103',
      # description: task[:description],
      start: {
        date_time: view_party.start_time,
        time_zone: "America/Denver"
        # date_time: '2019-09-07T09:00:00-07:00',
        # time_zone: 'America/Denver',
      },
      end: {
        date_time: view_party.end_time,
        time_zone: "America/Denver"
      },
      attendees: attendees,
      reminders: {
        use_default: false,
        overrides: [
          Google::Apis::CalendarV3::EventReminder.new(reminder_method:"popup", minutes: 10),
          Google::Apis::CalendarV3::EventReminder.new(reminder_method:"email", minutes: 20)
        ]
      },
      notification_settings: {
        notifications: [
                        {type: 'event_creation', method: 'email'},
                        {type: 'event_change', method: 'email'},
                        {type: 'event_cancellation', method: 'email'},
                        {type: 'event_response', method: 'email'}
                       ]
      }, 'primary': true
    })
  end
end
