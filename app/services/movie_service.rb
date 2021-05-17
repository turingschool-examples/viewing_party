class MovieService

  def top_40
    token = ENV['movie_token']

    response1 = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{token}&page=1&language=en-US")
    response2 = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{token}&page=2&language=en-US")

    result1 = JSON.parse(response1.body, symbolize_names: true)
    result2 = JSON.parse(response2.body, symbolize_names: true)

    result1[:results] + result2[:results]
  end

  def search
  end
end
