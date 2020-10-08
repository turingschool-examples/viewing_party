class Movie
  def get_movies(movie_count)
    page = 1
    movie_results = []
    until movie_results.length >= movie_count
      api_key = ENV['MOVIE_API_KEY']
      conn = Faraday.new(url: 'https://api.themoviedb.org')
      response = conn.get("/3/movie/top_rated?api_key=#{api_key}&language=en-US&page=#{page}")
      @json = JSON.parse(response.body, symbolize_names: true)
      @json[:results].each { |f| movie_results << f }
      page += 1
    end
    movie_results
  end
end
