require 'faraday'
require 'json'
require 'figaro'

class MoviedbService
  def conn
    Faraday.new(
      url: "https://api.themoviedb.org/3/",
      headers: {
        'Authorization' => "Bearer #{ENV['moviedb_bearer_token']}",
        'Language' => 'en-US',
        })
  end

  def get_popular_movies
    response = conn.get("movie/top_rated")
    data = JSON.parse(response.body, symbolize_names:true)
  end
end
