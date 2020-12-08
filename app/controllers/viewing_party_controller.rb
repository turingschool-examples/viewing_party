class ViewingPartyController < ApplicationController
  def new
    @movie_id = params[:id].to_i
    suffix = "/3/movie/#{@movie_id}"

    details_response = conn.get("#{suffix}?")
    @details = JSON.parse(details_response.body, symbolize_names: true)
  end

  def create
    @movie_id = params[:id].to_i
    suffix = "/3/movie/#{@movie_id}"

    details_response = conn.get("#{suffix}?")
    @details = JSON.parse(details_response.body, symbolize_names: true)
    redirect_to dashboard_path
  end

  private
  def conn
    Faraday.new("https://api.themoviedb.org") do |f|
      f.params[:api_key] = ENV["MOVIE_SEARCH_API_KEY"]
    end
  end
end
