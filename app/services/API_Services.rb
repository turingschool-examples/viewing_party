class APIServices
  class << self
    # def get_top_rated_movies
    #   response_pg_1 = conn.get("3/movie/top_rated")
    #   parse_json(response)
    #
    #   response_pg_2 = conn.get("3/movie/top_rated&page=2")
    #   parse_json(response)
    # end

    def get_search_movie(search_movie)
      response = conn.get("3/search/movie?query=#{search_movie}")
      parse_json(response)
    end

    def conn
      Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
        faraday.params['api_key'] = ENV['MOVIES_DB_API_KEY']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
