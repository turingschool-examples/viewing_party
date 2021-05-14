# require 'faraday'
# require 'json'
# require 'pry'
# require 'figaro'
class MovieService
  def get_popular_movies
    key = ENV['movie_api_key']
    response1 = Faraday.get("https://api.themoviedb.org/3/movie/popular?api_key=#{key}&language=en-US&page=1")
    response2 = Faraday.get("https://api.themoviedb.org/3/movie/popular?api_key=#{key}&language=en-US&page=2")
    json1 = JSON.parse(response1.body, symbolize_names: true)
    json2 = JSON.parse(response2.body, symbolize_names: true)
    response = json1[:results] + json2[:results] # 40 movies returned
  end

  def get_search_results(search_params)
    key = ENV['movie_api_key']
    search_params.gsub!(' ', '%20') if search_params.include?(' ')
    response = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=#{key}&language=en-US&query=#{search_params}&page=1&include_adult=false")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results]
  end
end

# test = MovieService.new
# test.get_popular_movies
# test.get_search_results("Mortal Kombat")
