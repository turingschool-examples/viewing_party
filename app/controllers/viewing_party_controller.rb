class ViewingPartyController < ApplicationController
  def new
    id = params["id"].to_i
    suffix = "/3/movie/#{id}"

    details_response = conn.get("#{suffix}?")
    @details = JSON.parse(details_response.body, symbolize_names: true)
  end

  def create
    id = params["id"].to_i
    suffix = "/3/movie/#{id}"

    details_response = conn.get("#{suffix}?")
    @details = JSON.parse(details_response.body, symbolize_names: true)
    require "pry"; binding.pry
  end

  private
  def conn
    Faraday.new("https://api.themoviedb.org") do |f|
      f.params[:api_key] = ENV["MOVIE_SEARCH_API_KEY"]
    end
  end
end
