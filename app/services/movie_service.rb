class MovieService
  def request_api(path)
    response = conn('http://api.themoviedb.org/3/').get(path) do |faraday|
      faraday.params['api_key'] = ENV['TMDB_API_KEY']
    end
    parse_json(response)
  end


  private

  def parse_json(response)
    JSON.parse(response.body, symbolize_name: true)
  end

  def conn(url)
    Faraday.new(url)
  end
end
