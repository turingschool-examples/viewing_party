class MovieFacade
  def self.top_movie(search = nil)
    json = ImdbService.top_movies(search)
    return 'No Movies Found' if json == []
    movies = json.map do |movie|
      Movie.new(movie)
    end
  end

  def self.movie_data
    
  end

  def self.movie_cast

  end
  
  def self.movie_reviews

  end
end