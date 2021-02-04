class MoviesService
  class << self
    def search_by_movie(movie)
      response = conn.get("/3/search/movie?=&query=#{movie}")
      parse_data(response)
    end

    private

    def conn
      Faraday.new(url: "https://api.themoviedb.org") do |faraday|
          faraday.params['api_key'] = ENV["TMD_api_key"]
          faraday.adapter Faraday.default_adapter
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end