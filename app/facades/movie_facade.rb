class MovieFacade
  def self.top_movie_results
    json = ImdbService.top_movies
    json.map do |movie|
      Movie.new(movie)
    end
  end

  def self.top_movie_search_results(search)
    json = ImdbService.top_movies_search(search)
    return 'No Movies Found' if json == []
    json.map do |movie|
      Movie.new(movie)
    end
  end

  def self.movie_data_results(id)
    json = ImdbService.movie_data(id)

    MovieData.new(json)
  end

  def self.movie_cast_results(id)
    cast_json = ImdbService.movie_cast(id)
    cast_json[:cast].map do |credit|
      if credit[:known_for_department] == 'Acting'
        credit[:name]
      end
    end[0..9]
  end

  def self.movie_review_results(id)
    review_json = ImdbService.movie_reviews(id)
    review_json[:results].map do |reviewer|
      MovieReview.new(reviewer)
    end
  end
end
