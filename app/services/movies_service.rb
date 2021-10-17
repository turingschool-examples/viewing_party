class MoviesService

  def get_data(endpoint)
    response = Faraday.get(endpoint)
    data = response.body
    JSON.parse(data, symbolize_names:  true)
  end

  def top_40
  first = get_data("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['API_KEY']}&language=en-US&page=1")
  second = get_data("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['API_KEY']}&language=en-US&page=2")
  end
end
