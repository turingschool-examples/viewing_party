

class MovieService
  def conn
    Faraday.new(url: 'https://api.themoviedb.org')
  end

  def all_movies
    page_num = 1
    movie_collection = []
    2.times do
      connection = conn.get("/3/discover/movie?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=#{page_num}")
      movie_collection = JSON.parse(connection.body, symbolize_names: true)
      movie_collection[:results].each do |movie|
        new_movie = Movie.new(title: movie[:title], api_id: movie[:id])
      end
      page_num += 1
    end
    require "pry"; binding.pry
  end

  def top_40_first_half
    connection = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=1")
    JSON.parse(connection.body, symbolize_names: true)
  end

  def top_40_second_half
    connection = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=2")
    JSON.parse(connection.body, symbolize_names: true)
  end

  def example_movie_request
    connection = conn.get("/3/movie/76341?api_key=#{ENV['MOVIE_API_KEY']}")
    JSON.parse(connection.body, symbolize_names: true)
  end
end
