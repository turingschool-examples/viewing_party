class MovieDbService
  class << self
    def top_40_movies
      response = conn.get("discover/movie?api_key=#{ENV["TMDB_API_KEY"]}&sort_by=popularity.desc&page=1")
      json = JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: 'https://api.themoviedb.org/3')
    end
  end
end
