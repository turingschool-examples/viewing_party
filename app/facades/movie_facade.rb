class MovieFacade
  def self.popular_movies
    json = MovieService.fetch_popular_movies
    json.map { |movie_info| MovieInfo.new(movie_info) }
  end

  def self.search_results(search_params)
    json = MovieService.get_search_results(search_params)
    json.map { |search_results| MovieInfo.new(search_results) }
  end

  def self.movie_details(search_params)
    json = MovieService.get_movie_details(search_params)
    MovieInfo.new(json)
  end

  def self.movie_cast_details(search_params)
    json = MovieService.get_movie_cast_details(search_params)
    json.map { |cast| MovieCast.new(cast) }
  end

  def self.movie_review_details(search_params)
    json = MovieService.get_movie_review_details(search_params)
    json.map { |review| MovieReview.new(review) }
  end

  def self.buy_provider(search_params)
    json = MovieService.get_buy_providers(search_params)
    json.map { |buy_provider| BuyProvider.new(buy_provider) }
  end

  def self.rent_provider(search_params)
    json = MovieService.get_rent_providers(search_params)
    json.map { |rent_provider| RentProvider.new(rent_provider) }
  end

  def self.streaming_provider(search_params)
    json = MovieService.get_streaming_providers(search_params)
    json.map { |streaming_provider| StreamingProvider.new(streaming_provider) }
  end

  def self.similar_movies(search_params)
    json = MovieService.get_similar_movies(search_params)
    json.map { |similar_movie| MovieInfo.new(similar_movie) }
  end
end
