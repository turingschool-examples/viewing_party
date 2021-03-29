require './app/services/movie_service'

class MoviesFacade

  def self.top_40
    @movies = []
    [1,2].reduce([]) do |memo, page|
      MovieService.top_films(page)[:results].each do |movie|
        @movies << Film.new(movie)
      end
      @movies
    end
  end

  def self.movie_search(query)
    @movies = []
    [1,2].reduce([]) do |memo, page|
      MovieService.film_finder(page, query)[:results].each do |movie|
        @movies << Film.new(movie)
      end
      @movies
    end
  end
end
