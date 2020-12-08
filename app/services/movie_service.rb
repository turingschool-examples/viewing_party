class MovieService
  def self.conn
    conn = Faraday.new(url: 'https://api.themoviedb.org')
  end

  def self.movies_search(page_number, uri, query=optional)
    response = conn.get("/3/#{uri}") do |rec|
      rec.params[:api_key] = ENV['TMDB_API_KEY']
      rec.params[:query] = query if query
      rec.params[:language] = 'en-US'
      rec.params[:page] = page_number + 1
      rec.params[:include_adult] = false
    end
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def self.movie_details(movie_id)
    uri = "movie/#{movie_id}"
    response = conn.get("/3/#{uri}") do |rec|
      rec.params[:api_key] = ENV['TMDB_API_KEY']
      rec.params[:movie_id] = movie_id
      rec.params[:append_to_response] = 'credits,reviews'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
