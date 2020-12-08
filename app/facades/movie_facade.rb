class MovieFacade
  def self.search(query=optional)
    uri = query.nil? ? 'movie/top_rated' : 'search/movie'
    films = []
    2.times do |n|
      films << MovieService.movies_search(n, uri, query)
    end
    films.flatten.map do |film_info|
      Film.new(film_info)
    end
  end

  def self.details(movie_id)
    Film.new(MovieService.movie_details(movie_id))
  end
end
