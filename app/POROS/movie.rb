class Movie
  def get_movies(movie_count)
    page = 1
    movie_results = []
    until movie_results.length >= movie_count
      api_key = ENV['MOVIE_API_KEY']
      conn = Faraday.new(url: 'https://api.themoviedb.org')
      response = conn.get("/3/movie/top_rated?api_key=#{api_key}&language=en-US&page=#{page}")
      @json = JSON.parse(response.body, symbolize_names: true)
      @json[:results].each { |f| movie_results << f }
      page += 1
    end
    movie_results
  end

  def get_specific_movie(id)
    api_key = ENV['MOVIE_API_KEY']
    conn = Faraday.new(url: 'https://api.themoviedb.org')
    response = conn.get("/3/movie/#{id}?api_key=#{api_key}&language=en-US")
    @json = JSON.parse(response.body, symbolize_names: true)
  end

  def calculate_time(movie)
    hours = movie[:runtime] / 60
    minutes = movie[:runtime] % 60
    hours > 1 ? "#{hours} hours and #{minutes}" : "#{hours} hour and #{minutes}"
  end

  def find_cast(id)
    api_key = ENV['MOVIE_API_KEY']
    conn = Faraday.new(url: 'https://api.themoviedb.org')
    response = conn.get("/3/movie/#{id}/credits?api_key=#{api_key}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def find_reviews(id)
    api_key = ENV['MOVIE_API_KEY']
    conn = Faraday.new(url: 'https://api.themoviedb.org')
    response = conn.get("/3/movie/#{id}/reviews?api_key=#{api_key}&language=en-US&page=1")
    JSON.parse(response.body, symbolize_names: true)
  end

  def convert_time(number)
    hour = number.to_s.chars[0..1].join.to_i
    minute = number.to_s.chars[-2..-1].join.to_i
    "#{hour}:#{minute}"
  end

  def convert_date(number)
    "#{number[0..1]}/#{number[2..3]}/#{number[4..5]}"
  end
end
