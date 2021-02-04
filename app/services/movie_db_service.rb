class MovieDbService
  class << self
    def call_top_40_films
      response = get("&sort_by=popularity.desc&page=1")
      parse_data(response)
    end

    private
    def get(query)
      conn.get("discover/movie?api_key=#{ENV["TMDB_API_KEY"]}#{query}")
    end

    def conn
      Faraday.new('https://api.themoviedb.org/3/')
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
