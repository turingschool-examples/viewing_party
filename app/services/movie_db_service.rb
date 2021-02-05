class MovieDbService
  class << self
    def call_top_films(page)
      discover(page)
    end

    def call_search_films(query)
      search(query)
    end

    def call_movie_info(mdb_id)
      movie_info(mdb_id)
    end

    private

    def movie_info(mdb_id)
      response = conn.get("movie/#{mdb_id}") do |req|
        req.params['api_key'] = ENV['TMDB_API_KEY']
      end
      JSON.parse(response.body, symbolize_names: true)
    end

    def discover(page)
      response = conn.get("discover/movie") do |req|
        req.params['api_key'] = ENV['TMDB_API_KEY']
        req.params['sort_by'] = 'popularity.desc'
        req.params['page'] = page
      end
      JSON.parse(response.body, symbolize_names: true)
    end
    
    def search(query)
      response = conn.get('search/movie') do |req|
        req.params['api_key'] = ENV['TMDB_API_KEY']
        req.params['query'] = query
      end
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new('https://api.themoviedb.org/3/')
    end
  end
end
