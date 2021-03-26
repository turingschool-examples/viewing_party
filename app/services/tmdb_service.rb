class TmdbService
  def top_rated(page_num)
    make_api_call("movie/top_rated?&language=en-US&page=#{page_num}")
  end

  def search(keywords)
    make_api_call("search/movie?&language=en-US&query=#{keywords}&page=1&include_adult=false")
  end

  def details(api_movie_id)
    make_api_call("movie/#{api_movie_id}?&language=en-US")
  end

  def cast(api_movie_id)
    make_api_call("movie/#{api_movie_id}/credits?&language=en-US")
  end

  def reviews(api_movie_id)
    make_api_call("movie/#{api_movie_id}/reviews?&language=en-US&page=1")
  end

  private

  def make_api_call(url)
    response = connection.get(url)
    data = response.body
    JSON.parse(data, symbolize_names: true)
  end

  def connection
    Faraday.new(url: 'https://api.themoviedb.org/3/', params: { api_key: ENV['movie_api_key'] })
  end
end
