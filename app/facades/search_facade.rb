class SearchFacade
  def self.search_movies(keyword, api)
    results = MovieInfo.search_movies(keyword, api)
    results.map do |data|
      CreateMovie.new(data)
    end
  end

  def self.get_40_movies(movie_count, api)
    movie_results = MovieInfo.get_40_movies(movie_count, api)
    movie_results.map do |data|
      CreateMovie.new(data)
    end
  end

  def self.get_specific_movie(id, api_key)
    movie = MovieInfo.get_specific_movie(id, api_key)
    CreateMovie.new(movie)
  end

  def self.find_cast(id, api_key)
    result = MovieInfo.find_cast(id, api_key)[:cast]
    result.map do |member|
      CreateActor.new(member)
    end
  end

  def self.find_reviews(id, api_key)
    result = MovieInfo.find_reviews(id, api_key)
    return [] if result[:total_results] == []

    result[:results].map do |review|
      CreateReview.new(review)
    end
  end
end
