class MovieService
  def conn
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

  def top_40
    page_num = 1
    movies = []
    2.times do
      connection = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=1")
      movies << JSON.parse(connection.body, symbolize_names: true)[:results]
    end
    movies.flatten
  end

  def find(title)
    page_num = 1
    movies = []
    2.times do
      connection = conn.get("/3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&language=en&query=#{title}&page=#{page_num}")
      movies << JSON.parse(connection.body, symbolize_names: true)[:results]
      page_num +=1
    end
    movies.flatten
  end
end
