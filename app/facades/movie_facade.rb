class MovieFacade
  def self.top_movie_results
    json = self.top_movies
    json.map do |movie|
      Movie.new(movie)
    end
  end

  def self.top_movies(movie_numbers = 40)
    results_array = []
    page_number = 1
    until results_array.length >= movie_numbers
      response = ImdbService.top_movies_page(page_number)
      results = response[:results]
      results.each do |movie|
        results_array << movie
      end
      page_number +=1
    end
    results_array.first(movie_numbers)
  end

  def self.top_movie_search_results(search)
    json = self.top_movies_search(search)
    return 'No Movies Found' if json == []
    json.map do |movie|
      Movie.new(movie)
    end
  end

  def self.top_movies_search(search = nil, movie_numbers = 40)
    search_terms = search.gsub(' ', '+')
    results_array = []
    page_number = 1
    until results_array.length >= movie_numbers
      response = ImdbService.top_movies_search_page(search_terms, page_number)
      results = response[:results]
      if results == []
        return []
      end
      results.each do |movie|
        results_array << movie
      end
      page_number +=1
    end
    results_array.first(movie_numbers)
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
