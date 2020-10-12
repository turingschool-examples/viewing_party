class MovieStats
  # def get_specific_movie(id)
  #   api_key = ENV['MOVIE_API_KEY']
  #   conn = Faraday.new(url: 'https://api.themoviedb.org')
  #   response = conn.get("/3/movie/#{id}?api_key=#{api_key}&language=en-US")
  #   @json = JSON.parse(response.body, symbolize_names: true)
  # end
  def self.calculate_time(movie)
    hours = movie.runtime / 60
    minutes = movie.runtime % 60
    hours > 1 ? "#{hours} hours and #{minutes}" : "#{hours} hour and #{minutes}"
  end
  # def find_cast(id)
  #   api_key = ENV['MOVIE_API_KEY']
  #   conn = Faraday.new(url: 'https://api.themoviedb.org')
  #   response = conn.get("/3/movie/#{id}/credits?api_key=#{api_key}")
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  # def find_reviews(id)
  #   api_key = ENV['MOVIE_API_KEY']
  #   conn = Faraday.new(url: 'https://api.themoviedb.org')
  #   response = conn.get("/3/movie/#{id}/reviews?api_key=#{api_key}&language=en-US&page=1")
  #   JSON.parse(response.body, symbolize_names: true)
  # end
end
