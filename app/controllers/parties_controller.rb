class PartiesController < ApplicationController
  def new
    @movie_id = params[:id].to_i
    suffix = "/3/movie/#{@movie_id}"

    details_response = conn.get("#{suffix}?")
    @details = JSON.parse(details_response.body, symbolize_names: true)
  end

  def create
    user = User.find(current_user.id)
    @party = user.parties.create!(user_id: user.id, movie_title: params[:movie_title], duration: params[:duration], day: params[:day], start_time: params[:start_time])
    redirect_to dashboard_path
  end

  private
  def conn
    Faraday.new("https://api.themoviedb.org") do |f|
      f.params[:api_key] = ENV["MOVIE_SEARCH_API_KEY"]
    end
  end
end
