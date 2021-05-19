class PartiesController < ApplicationController
  def new
    @movie_title = params['title']
    @movie_runtime = params['duration']
    @movie_id = params['movie_id']
  end

  def create
    @party = Party.create!(movie_title: params[:title], start_time: params[:start_time], date: params[:date], duration: params[:duration], movie_api_id: params[:movie_id])
    @friends = params.select do |k,v|
      v == "1"
    end.keys
    Attendee.create!(user_id: current_user.id, party_id: @party.id, status: 1)
    @friends.map do |email|
      user = User.find_by(email: email)
      Attendee.create!(user_id: user.id, party_id: @party.id, status: 0)
    end
    redirect_to dashboard_path
  end
end
