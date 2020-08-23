class MovieService
  def get_top_40
    page_1 = connection.get('/3/movie/top_rated') do |f|
      f.headers['Content-Type'] = 'application/json'
      f.params['api_key']       = ENV['TMDB_API_KEY']
    end

    page_2 = connection.get('/3/movie/top_rated') do |f|
      f.headers['Content-Type'] = 'application/json'
      f.params['api_key']       = ENV['TMDB_API_KEY']
      f.params['page']          = '2'
    end

    parsed_1 = JSON.parse(page_1.body, symbolize_names: true)
    parsed_2 = JSON.parse(page_2.body, symbolize_names: true)

    parsed_1[:results] + parsed_2[:results]
  end

  def from_search(terms)
    page_1 = connection.get('/3/search/movie') do |f|
      f.headers['Content-Type'] = 'application/json'
      f.params['api_key']       = ENV['TMDB_API_KEY']
      f.params['query']         = terms
    end

    page_2 = connection.get('/3/search/movie') do |f|
      f.headers['Content-Type'] = 'application/json'
      f.params['api_key']       = ENV['TMDB_API_KEY']
      f.params['query']         = terms
      f.params['page']          = '2'
    end

    parsed_1 = JSON.parse(page_1.body, symbolize_names: true)
    parsed_2 = JSON.parse(page_2.body, symbolize_names: true)

    parsed_1[:results] + parsed_2[:results]
  end

  def movie_details(movie_id)
    response = connection.get("/3/movie/#{movie_id}") do |f|
      f.headers['Content-Type'] = 'application/json'
      f.params['api_key']       = ENV['TMDB_API_KEY']
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def cast_details(movie_id)
    response = connection.get("/3/movie/#{movie_id}/credits") do |f|
      f.headers['Content-Type'] = 'application/json'
      f.params['api_key']       = ENV['TMDB_API_KEY']
    end

    parsed = JSON.parse(response.body, symbolize_names: true)

    parsed[:cast]
  end

  def reviews_details(movie_id)
    response = connection.get("/3/movie/#{movie_id}/reviews") do |f|
      f.headers['Content-Type'] = 'application/json'
      f.params['api_key']       = ENV['TMDB_API_KEY']
    end

    parsed = JSON.parse(response.body, symbolize_names: true)

    parsed[:results]
  end

  private

  def connection
    Faraday.new('https://api.themoviedb.org')
  end
end
