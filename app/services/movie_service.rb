class MovieService
  def top_40
    page1 = top_rated('1')
    page2 = top_rated('2')

    parsed1 = JSON.parse(page1.body, symbolize_names: true)
    parsed2 = JSON.parse(page2.body, symbolize_names: true)

    parsed1[:results] + parsed2[:results]
  end

  def from_search(terms)
    page1 = movie_search(terms, '1')
    page2 = movie_search(terms, '2')

    parsed1 = JSON.parse(page1.body, symbolize_names: true)
    parsed2 = JSON.parse(page2.body, symbolize_names: true)

    parsed1[:results] + parsed2[:results]
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

  def top_rated(page)
    connection.get('/3/movie/top_rated') do |f|
      f.headers['Content-Type'] = 'application/json'
      f.params['api_key']       = ENV['TMDB_API_KEY']
      f.params['page']          = page
    end
  end

  def movie_search(terms, page)
    connection.get('/3/search/movie') do |f|
      f.headers['Content-Type'] = 'application/json'
      f.params['api_key']       = ENV['TMDB_API_KEY']
      f.params['query']         = terms
      f.params['page']          = page
    end
  end
end
