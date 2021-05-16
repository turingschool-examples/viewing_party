class MovieService

  def top_40
    token = ENV['movie_token']

    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{token}&language=en-US&page=1&page=2")

    data = response.body
    JSON.parse(data, symbolize_names: true)
  end
end
