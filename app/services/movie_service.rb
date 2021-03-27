class MovieService
  def self.find_top_40(page_number)
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=09b6c4f6542d8f32ac4fce3659c4760b&language=en-US&page=#{page_number}")
  end

  def self.search_movies(name)
    name = name.gsub(" ", "+")
    response = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=f0c298d2cec5b417a0f13af4ee1ea4cf&query=#{name}")
    parsed = JSON.parse(response.body, symbolize_names: true)[:results]
    # require "pry"; binding.pry
  end

  def self.make_searched_movies(name)
    unless search_movies(name).nil?
      search_movies(name).map do |movie_data|
        Film.new(movie_data)
      end
    end
  end



  def self.get_top_rated
    movies = []
    x = 1
    until movies.size >= 40 do
      response = MovieService.find_top_40(x)
      parsed = JSON.parse(response.body, symbolize_names: true)
      parsed[:results].map do |film|
        movies << Film.new(film)
       end
      x += 1
    end
    movies[0..39]
  end
end
