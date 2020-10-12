class SearchFacade
  def self.search_movies(keyword, api)
    # conn = Faraday.new(url: 'https://api.themoviedb.org')
    # response = conn.get("/3/search/movie?api_key=#{api}&language=en-US&query=#{keyword}&page=1&include_adult=false")
    # response2 = conn.get("/3/search/movie?api_key=#{api}&language=en-US&query=#{keyword}&page=2&include_adult=false")
    # json = JSON.parse(response.body, symbolize_names: true)
    # json2 = JSON.parse(response2.body, symbolize_names: true)
    # first20 = json[:results]
    # first20 << json2[:results]
    # results = first20.flatten
    results = MovieInfo.search_movies(keyword, api)
    results.map do |data|
      CreateMovie.new(data)
    end
  end

  def self.get_40_movies(movie_count, api)
    # page = 1
    # movie_results = []
    # until movie_results.length >= movie_count
    #   conn = Faraday.new(url: 'https://api.themoviedb.org')
    #   response = conn.get("/3/movie/top_rated?api_key=#{api}&language=en-US&page=#{page}")
    #   json = JSON.parse(response.body, symbolize_names: true)
    #   json[:results].each { |f| movie_results << f }
    #   page += 1
    # end
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
