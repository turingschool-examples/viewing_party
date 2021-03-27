class MovieService
  def self.movie_search_get(name, page_num)
    response = connection.get("/3/search/movie") do |f|
      f.params["api_key"] = ENV['mdb_key']
      f.params['query'] = name.gsub(' ', '+')
    end
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_search_objects(name)
    movies = []
    page_num = 1
    if movie_search_get(name, page_num)[:total_results] != 0
      until movies.size >= 40 || movies.size == movie_search_get(name, page_num)[:total_results] do
        movie_search_get(name, page_num)[:results].map do |result|
          movies << MovieObject.new(result)
        end
        page_num += 1
      end
      movies.first(40)
  end
  end

  def self.top_40_get(page_num)
    response = connection.get("/3/movie/top_rated") do |f|
      f.params["api_key"] = ENV['mdb_key']
      f.params["language"] = 'en-US'
      f.params['page'] = page_num
    end
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_40_objects
    movies = []
    page_num = 1
    until movies.size >= 40 do
      self.top_40_get(page_num)[:results].each do |result|
        movies << MovieObject.new(result)
      end
      page_num += 1
    end
    movies.first(40)
  end

  def self.movie_details_get(movie_id)
    response = connection.get("/3/movie/#{movie_id}") do |f|
      f.params["api_key"] = ENV['mdb_key']
      f.params["language"] = 'en-US'
    end
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_object(movie_id)
    MovieObject.new(movie_details_get(movie_id))
  end

  def self.movie_cast_get(movie_id)
    response = connection.get("/3/movie/#{movie_id}/credits") do |f|
      f.params["api_key"] = ENV['mdb_key']
      f.params["language"] = 'en-US'
    end
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.reviews_get(movie_id)
    response = connection.get("/3/movie/#{movie_id}/reviews?page=1") do |f|
      f.params["api_key"] = ENV['mdb_key']
      f.params["language"] = 'en-US'
    end
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.no_movies?(name)
    return 'no_movies' if movie_search_get(name, 1)[:total_results].zero?
    'movies'
  end

  def self.top_40_partial
    'movies'
  end

  private
  def self.connection
    Faraday.new(url: "https://api.themoviedb.org")
  end
end
