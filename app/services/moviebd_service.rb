class MovieDBService
  def top_rated
    top_rated = con.get("/top_rated?api_key=#{ENV['MOVIE_DATA_BASE_API_KEY']}&language=en-US&page=1")
    JSON.parse(top_rated.body, symbolize_names: true)
  end

  private

  def conn
    conn = Faraday.new(url: "https://api.themoviedb.org/3/movie")
    # "/76341?api_key=#{ENV['MOVIE_DATA_BASE_API_KEY']}"
  end
end
