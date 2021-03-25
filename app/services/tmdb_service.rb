class TmdbService
  def top_rated(page_num)
    @top_movies1 = make_api_call("https://api.themoviedb.org/3/movie/top_rated?api_key=8fcfd8353e4732fe3783cb092cfaf65e&language=en-US&page=#{page_num}")
  end

  def search(keywords)
    make_api_call("https://api.themoviedb.org/3/search/movie?api_key=8fcfd8353e4732fe3783cb092cfaf65e&language=en-US&query=#{keywords}&page=1&include_adult=false")
  end

  def details(api_movie_id)
    make_api_call("https://api.themoviedb.org/3/movie/#{api_movie_id}?api_key=8fcfd8353e4732fe3783cb092cfaf65e&language=en-US")
  end

  def cast(api_movie_id)
    make_api_call("https://api.themoviedb.org/3/movie/#{api_movie_id}/credits?api_key=8fcfd8353e4732fe3783cb092cfaf65e&language=en-US")
  end

  def reviews(api_movie_id)
    make_api_call("https://api.themoviedb.org/3/movie/#{api_movie_id}/reviews?api_key=8fcfd8353e4732fe3783cb092cfaf65e&language=en-US&page=1")
  end

  def make_api_call(url)
    response = Faraday.get(url)
    data = response.body
    JSON.parse(data, symbolize_names: true)
  end
end
