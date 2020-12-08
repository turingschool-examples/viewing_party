class SearchService
  def self.search_results(title)
    suffix = "/3/search/movie?"

    response = conn.get("#{suffix}&language=en-US&query=#{title}&page=1&include_adult=false")

    movies = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new("https://api.themoviedb.org") do |f|
      f.params[:api_key] = ENV["MOVIE_SEARCH_API_KEY"]
    end
  end
end
