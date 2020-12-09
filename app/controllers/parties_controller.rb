class PartiesController < ApplicationController
  def new
    @movie_id = params[:id].to_i
    suffix = "/3/movie/#{@movie_id}"

    details_response = conn.get("#{suffix}?")
    @details = JSON.parse(details_response.body, symbolize_names: true)
  end

  def create

    user = User.find(current_user.id)
    day = params[:day].values.join("/")
    start_time = params[:start_time].values.join(":")

    @party = user.parties.create!(user_id: user.id, movie_title: params[:movie_title], duration: params[:duration], day: day, start_time: start_time)
    party_friends = params[:friend_ids]

    party_friends.each do |friend_id|
      @party.guests.create!({party_id: @party.id, user_id: friend_id.to_i})
    end
    redirect_to dashboard_path
  end

  private
  def conn
    Faraday.new("https://api.themoviedb.org") do |f|
      f.params[:api_key] = ENV["MOVIE_SEARCH_API_KEY"]
    end
  end

end
