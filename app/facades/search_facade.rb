class SearchFacade
  def self.results(title)
    movies = SearchService.search_results(title)
    @search = movies[:results].map do |search_data|
      Search.new(search_data)
    end
  end

  def self.credits(id)
    credits = SearchService.find_cast(id)
    @cast = credits[:cast][0..9].map do |cast_data|
      Cast.new(cast_data)
    end
  end

  def self.details(id)
    @details = SearchService.find_details(id)
      Detail.new(@details)
  end

  def self.reviews(id)
    @reviews = SearchService.find_reviews(id)
      Review.new(@reviews)
  end
end
