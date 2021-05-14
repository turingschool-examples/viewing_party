# require 'faraday'
# require 'json'

class MovieService
  def get_movie_data
    key = ENV['movie_api_key']
    response1 = Faraday.get("https://api.themoviedb.org/3/movie/popular?api_key=#{key}&language=en-US&page=1")
    response2 = Faraday.get("https://api.themoviedb.org/3/movie/popular?api_key=#{key}&language=en-US&page=2")
    json1 = JSON.parse(response1.body, symbolize_names: true)
    json2 = JSON.parse(response2.body, symbolize_names: true)
    response = json1[:results] + json2[:results] # 40 movies returned
  end
end
