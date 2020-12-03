class MovieApiService
  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params[:api_key] = '7764c558db179fb3d04a49c710fe500c'
    end
  end

  def self.parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_rated_movies
    page = 1
    top_movies = []

    2.times do
      response = conn.get("/3/movie/top_rated") do |movie|
        movie.params[:page] = page
      end

      movies = parse_data(response)

      top_movies.concat(movies[:results])
      page+=1
    end
    top_movies
  end
end
