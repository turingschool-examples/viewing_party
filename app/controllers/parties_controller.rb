class PartiesController < ApplicationController
  def new
    @movie_title = params['title']
    @movie_runtime = params['duration']
  end

  def create
    @party = Party.create!(movie_title: params[:title], start_time: params[:start_time], date: params[:date], duration: params[:duration])
    @movie_title = params[:title]
    @friends = params.select do |k,v|
      v == "1"
    end.keys
    @host = Attendee.create!(user_id: current_user.id, party_id: @party.id, status: 1)
    @attendees = @friends.map do |email|
      user = User.find_by(email: email)
      Attendee.create!(user_id: user.id, party_id: @party.id, status: 0)
    end
    # require "pry"; binding.pry
    redirect_to dashboard_path
    # render 'users/show'
  end
end
