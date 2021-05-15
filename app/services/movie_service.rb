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
    unless search_params.nil?
      search_params.gsub!(' ', '%20') if search_params.include?(' ')
      response = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=#{key}&language=en-US&query=#{search_params}&page=1&include_adult=false")
      json = JSON.parse(response.body, symbolize_names: true)
      json[:results]
    end
  end

  def get_movie_details(search_params)
    key = ENV['movie_api_key']
    unless search_params.nil?
      response = Faraday.get("https://api.themoviedb.org/3/movie/#{search_params}?api_key=#{key}&language=en-US")
      json = JSON.parse(response.body, symbolize_names: true)
    end
  end

  def get_movie_cast_details(search_params)
    key = ENV['movie_api_key']
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{search_params}/credits?api_key=#{key}&language=en-US")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:cast][0..9] if json[:status_code] != 34
  end

  def get_movie_review_details(search_params)
    key = ENV['movie_api_key']
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{search_params}/reviews?api_key=#{key}&language=en-US")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results] if json[:status_code] != 34
  end
end
