require 'faraday'
require 'json'
require 'figaro'

class MoviedbService
  def conn
    Faraday.new(
      url: "https://api.themoviedb.org",
      headers: {
        'Authorization' => "Bearer #{ENV['moviedb_bearer_token']}",
        'Language' => 'en-US',
        })
  end

  def get_popular_movies
    response = conn.get("3/movie/popular")
    data = JSON.parse(response.body, symbolize_names:true)
    data[:results].map do |k,v|
      k[:title] + " vote average:" + k[:vote_average].to_s
    end
  end
end
