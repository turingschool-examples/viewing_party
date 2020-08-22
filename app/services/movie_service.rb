class MovieService
  def get_top_rated
    top_rated1 = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_DATA_BASE_API_KEY']}&language=en-US&page=1")
    top_rated2 = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_DATA_BASE_API_KEY']}&language=en-US&page=2")

    page1 = JSON.parse(top_rated1.body, symbolize_names: true)
    page2 = JSON.parse(top_rated2.body, symbolize_names: true)

    top_40 = (page1[:results] << page2[:results]).flatten!
    top_40
  end

  def search(keywords)
    search1 = conn.get("/3/search/movie?api_key=#{ENV['MOVIE_DATA_BASE_API_KEY']}&query=#{keywords}&page=1")
    search2 = conn.get("/3/search/movie?api_key=#{ENV['MOVIE_DATA_BASE_API_KEY']}&query=#{keywords}&page=2")

    page1 = JSON.parse(search1.body, symbolize_names: true)
    page2 = JSON.parse(search2.body, symbolize_names: true)
    
    top_40 = (page1[:results] << page2[:results]).flatten!
    top_40
  end

  private

  def conn
    Faraday.new(url: "https://api.themoviedb.org")
    # "/76341?api_key=#{ENV['MOVIE_DATA_BASE_API_KEY']}"
  end
end
