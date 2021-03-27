class MovieService

  def get_data(arg)
    response = Faraday.get("https://api.themoviedb.org/3/#{arg}") do |request|
      request.params['api_key'] = ENV['MOVIE_API']
      request.params['language'] = 'en-US'
    end
  end

  def films(page)
    response = get_data("movie/top_rated?page=#{page}")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def film_finder(page, query)
    response = get_data("search/movie?&query=#{query}&page=#{page}&include_adult=false")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
