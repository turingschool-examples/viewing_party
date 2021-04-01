class MovieFacade
  def self.search(query, limit)
    MovieService.movie_search(query, limit)
  end

  def self.top_movies(limit)
    MovieService.top_movies(limit)
  end

  def self.movie_information(api_movie_id)
    MovieService.movie_information(api_movie_id)
  end

  def self.create_movie(api_id)
    if Movie.exists?(api_id)
      movie = Movie.find_by(api_id)
    else
      movie = Movie.create({ api_id: api_id })
    end
    movie
  end

  def self.trending_movies(limit)
    MovieService.trending_movies(limit)
  end
end
