class MovieService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org')
  end

  # def all_movies
  #   page_num = 1
  #   movie_collection = []
  #   500.times do
  #     connection = conn.get("/3/discover/movie?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=#{page_num}")
  #     movie_collection = JSON.parse(connection.body, symbolize_names: true)
  #     movie_collection[:results].each do |movie|
  #       new_movie = Movie.create(title: movie[:title], api_id: movie[:id])
  #     end
  #     page_num += 1
  #   end
  # end

  def self.find_top_40
    page_n = 1
    movies_data = []
    2.times do
      connection = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=#{page_n}")
      movies_data << JSON.parse(connection.body, symbolize_names: true)[:results]
      page_n += 1
    end
    movies_data.flatten
  end

  def self.find_title(title)
    page_n = 1
    movies_data = []
    2.times do
      connection = conn.get("/3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&language=en&query=#{title}&page=#{page_n}")
      movies_data << JSON.parse(connection.body, symbolize_names: true)[:results]
      page_n += 1
    end
    movies_data.flatten
  end

  def self.get_details(movie_id)
    connection = conn.get(
      "/3/movie/#{movie_id}?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US"
    )
    JSON.parse(connection.body, symbolize_names: true)
  end

  def self.get_reviews(movie_id)
    page_n = 1
    reviews_data = []
    until page_n > find_total_review_pages(movie_id)
      connection = conn.get("3/movie/#{movie_id}/reviews?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=#{page_n}")
      reviews_data << JSON.parse(connection.body, symbolize_names: true)[:results]
      page_n += 1
    end
    reviews_data.flatten
  end

  def self.find_total_review_pages(movie_id)
    init_connection = conn.get(
      "3/movie/#{movie_id}/reviews?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=1"
    )
    JSON.parse(init_connection.body, symbolize_names: true)[:total_pages]
  end

  def self.get_cast(movie_id)
    connection = conn.get(
      "/3/movie/#{movie_id}/credits?api_key=#{ENV['MOVIE_API_KEY']}"
    )
    JSON.parse(connection.body, symbolize_names: true)[:cast].take(10)
  end
end
