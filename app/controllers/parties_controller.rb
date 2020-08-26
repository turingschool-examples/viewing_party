require 'google/api_client/client_secrets.rb'
require 'google/apis/calendar_v3'

class PartiesController < ApplicationController
  def new
    @movie = Movie.details(params[:id])
    friends_ids = Friendship.where(user_id: current_user.id).pluck('friend_id')
    @friends = User.find(friends_ids)
  end

  def create
    new_party = Party.create({ title: params[:title],
                               party_date: params[:party_date],
                               party_time: params[:party_time],
                               attendees: params[:friend_id].values,
                               user_id: current_user.id })
    if new_party.save
      flash[:success] = "Party for #{params[:title]} on #{params[:party_date]} at #{params[:party_time]} was created"
      redirect_to dashboard_path
    end
    post_to_calendar
  end

  def post_to_calendar
    access_token = AccessToken.new current_user.token
    calendar = Google::Apis::CalendarV3
    client = calendar::CalendarService.new
    client.authorization = access_token

    month, day, year = params[:party_date].split('/').map(&:to_i)
    hour, minute = params[:party_time].split(':').map(&:to_i)
    party_duration = params[:duration_of_party].to_i
    start = DateTime.new(year, month, day, hour, minute, 0, '-06:00')
    end_time = DateTime.new(year, month, day, hour + (party_duration / 60), minute + (party_duration % 60), 0, '-06:00')

    event = Google::Apis::CalendarV3::Event.new(
      summary: 'Viewing Party With Friends',
      location: 'Internet',
      description: params[:title].to_s,
      start: Google::Apis::CalendarV3::EventDateTime.new(
        date_time: start,
        time_zone: 'America/Denver'
      ),
      end: Google::Apis::CalendarV3::EventDateTime.new(
        date_time: end_time,
        time_zone: 'America/Denver'
      )
    )
    client.insert_event('primary', event)
  end

  private

  def google_secret
    Google::APIClient::ClientSecrets.new(
      { 'web' =>
        { 'access_token' => current_user.token,
          'refresh_token' => current_user.refresh_token,
          'client_id' => Rails.application.secrets.google_client_id,
          'client_secret' => Rails.application.secrets.google_client_secret } }
    )
  end
end

class AccessToken
  attr_reader :token
  def initialize(token)
    @token = token
  end

  def apply!(headers)
    headers['Authorization'] = "Bearer #{@token}"
  end
end
