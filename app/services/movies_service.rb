class MoviesService

  class << self
    def search_by_movie(movie)
      prepare_json("/3/search/movie?=&query=#{movie}")
    end

    def top_rated_movies
      prepare_json("/3/movie/top_rated")
    end

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

    def prepare_json(path)
      page = 1
      array = []
      2.times do
        response = conn.get(path) do |req|
          req.params[:page] = page
          page += 1
        end
        array << parse_data(response)[:results]
      end
      array.flatten!
    end
  end
end
