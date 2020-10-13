class SearchFacade
  def self.search_movies(keyword)
    results = MovieInfo.search_movies(keyword)
    results.map do |data|
      CreateMovie.new(data)
    end
  end

  def self.get_40_movies(movie_count)
    movie_results = MovieInfo.get_40_movies(movie_count)
    movie_results.map do |data|
      CreateMovie.new(data)
    end
  end

  # change above method, it's redundant to have 40, then movie count in argument
  def self.get_specific_movie(id)
    movie = MovieInfo.get_specific_movie(id)
    CreateMovie.new(movie)
  end

  def self.find_cast(id)
    result = MovieInfo.find_cast(id)[:cast]
    result.map do |member|
      CreateActor.new(member)
    end
  end

  def self.find_reviews(id)
    result = MovieInfo.find_reviews(id)
    return [] if result[:total_results] == []

    result[:results].map do |review|
      CreateReview.new(review)
    end
  end
end
