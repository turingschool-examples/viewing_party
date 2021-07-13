class APIServices << self
  #movie search
  def get_search_movie(movie_search)
    response = conn.get("3/search/movie?query=#{movie_search}")
    parse_json(response)
  end

  private

  def conn
    Faraday.new(url: 'https://api.themoviedb.org/3') do |faraday|
      faraday.params["X-API-KEY"] = ENV['THE_MOVIES_DB_API_KEY']
    end
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
