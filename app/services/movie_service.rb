require 'faraday'
require 'pry'
require 'json'

class MovieService
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
