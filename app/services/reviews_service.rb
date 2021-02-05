class ReviewsService
  class << self
     def retrieve_review(movie_id)
      response = conn.get("/3/movie/#{movie_id}/reviews")
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