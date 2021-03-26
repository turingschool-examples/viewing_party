require 'movie'
class MovieService
  def self.movie_search(name)
    response = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=ad4941ff23859e195ff1169f1ffc04fa&query=#{name.gsub(' ', '+')}")
    parsed = JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def self.get(page_num)
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=ad4941ff23859e195ff1169f1ffc04fa&language=en-US&page=#{page_num}")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_40
    movies = []
    count = 1
    until movies.size == 40 do
      self.get(count)[:results].map do |data|
        require "pry"; binding.pry
        movies << Movie.new(data)
        count += 1
      end
    end
    movies
  end
end
