class MovieService
  def self.movie_search_get(name, page_num)
    response = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=ad4941ff23859e195ff1169f1ffc04fa&query=#{name}&page=#{page_num}")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_search_objects(name)
    movies = []
    page_num = 1
    until movies.size >= 40 || movies.size == movie_search_get(name, page_num)[:total_results] do
      movie_search_get(name, page_num)[:results].map do |result|
        movies << MovieObject.new(result)
        page_num += 1
      end
    end
    movies.first(40)
  end

  def self.top_40_get(page_num)
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=ad4941ff23859e195ff1169f1ffc04fa&language=en-US&page=#{page_num}")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_40_objects
    movies = []
    page_num = 1
    until movies.size >= 40 do
      self.top_40_get(page_num)[:results].each do |result|
        movies << MovieObject.new(result)
        page_num += 1
      end
    end
    movies.first(40)
  end

  def self.movie_details_get(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=ad4941ff23859e195ff1169f1ffc04fa&language=en-US")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_object(movie_id)
    MovieObject.new(movie_details_get(movie_id))
  end

  def self.movie_cast_get(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=ad4941ff23859e195ff1169f1ffc04fa&language=en-US")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.reviews_get(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=ad4941ff23859e195ff1169f1ffc04fa&language=en-US&page=1")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
