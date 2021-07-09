require 'faraday'
require 'pry'
require 'json'

class MovieService

  def top_rated
    request_api("/3/movie/top_rated")
  end

  def find_by_title(title)
    request_api("3/search/movie?query=#{title}")
  end

  def find_by_id(movie_id)
    request_api("3/movie/#{movie_id}")
  end
  
  def request_api(path)
    resp = conn('https://api.themoviedb.org/').get(path) do |faraday|
      faraday.params['api_key'] = ENV["themoviedb_key"]
    end
    parse_json(resp)
  end
  
  private 
    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn(url)
      Faraday.new(url)
    end
end
