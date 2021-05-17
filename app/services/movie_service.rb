class MovieService
  def self.conn
    Faraday.new(
    url: "https://api.themoviedb.org/3/",
    # headers: {'Authorization' => api_key: "#{ENV['MOVIE_TOKEN']}"}
    params: { api_key: ENV['MOVIE_TOKEN'] }
    )
  end

  def self.get_top_rated_movies
    page_1 = conn.get('movie/top_rated?&page=1')
    page_2 = conn.get('movie/top_rated?&page=2')

    page_1_json = JSON.parse(page_1.body, symbolize_names: true)
    page_2_json = JSON.parse(page_2.body, symbolize_names: true)
    movie_list = page_1_json[:results] + page_2_json[:results]
  end

  def self.list_movies_by_keyword(query)
    page_1= conn.get("search/movie?api_key=#{ENV['MOVIE_TOKEN']}&query=#{query}")
    page_1_json = JSON.parse(page_1.body, symbolize_names: true)
    movie_list = page_1_json[:results]
  end

  def self.return_single_movie(id)
    selected_movie = conn.get("movie/#{id}?api_key=#{ENV['MOVIE_TOKEN']}&language=en-US")
    JSON.parse(selected_movie.body, symbolize_names: true)
  end
  # def self.search(query)
  #   results = conn.get("/search/movie?api_key=#{ENV['MOVIE_TOKEN']}&language=en-US&page=1&include_adult=false&query=#{query}")
  #   parsed_results = JSON.parse(results.body, symbolize_names: true)
  # end
end

