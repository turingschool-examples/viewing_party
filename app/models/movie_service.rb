class MovieService
  attr_reader :uuid, :title
  def initialize(uuid)
    @uuid = uuid
    @title = movie_data(uuid)[:original_title]
  end

  def movie_data(uuid)
    conn = Faraday.new("https://api.themoviedb.org")
    response = conn.get("/3/movie/#{uuid}?api_key=#{ENV['MDB_API_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end

end
