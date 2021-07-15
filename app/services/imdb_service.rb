class ImdbService

  def self.top_movies_page(page)
    response = con.get("/3/discover/movie?sort_by=popularity.desc&page=#{page}")
    body = response.body
    JSON.parse(body, symbolize_names: true)
  end

  def self.top_movies_search_page(search, page)
    response = con.get("/3/search/movie?query=#{search}&page=#{page}")
    body = response.body
    JSON.parse(body, symbolize_names: true)
  end

  def self.movie_data(movie_id)
    response = con.get "/3/movie/#{movie_id}"
    body = response.body
    JSON.parse(body, symbolize_names: true)
  end

  def self.movie_cast(movie_id)
    response = con.get "/3/movie/#{movie_id}/credits"
    body = response.body
    JSON.parse(body, symbolize_names: true)
  end

  def self.movie_reviews(movie_id)
    response = con.get "/3/movie/#{movie_id}/reviews"
    body = response.body
    JSON.parse(body, symbolize_names: true)
  end

  private

  def self.con
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params[:api_key] = ENV['IMDB_KEY']
    end
  end
end
