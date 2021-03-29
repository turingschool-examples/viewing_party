class MoviesFacade
  def self.top40
    @movies = []
    [1, 2].reduce([]) do |_memo, page|
      MovieService.top_films(page)[:results].each do |movie|
        @movies << Film.new(movie)
      end
      @movies
    end
  end

  def self.movie_search(query)
    @movies = []
    [1, 2].reduce([]) do |_memo, page|
      MovieService.film_finder(page, query)[:results].each do |movie|
        @movies << Film.new(movie)
      end
      @movies
    end
  end

  def self.movie_info(id)
    MovieService.movie_data(id)
  end
end
