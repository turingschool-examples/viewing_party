class MovieService
  def self.find_top_40(page_number)
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=09b6c4f6542d8f32ac4fce3659c4760b&language=en-US&page=#{page_number}")
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
