class MoviesFacade
  def self.get_top_movies
    conn = Faraday.new(url: "https://api.themoviedb.org")
    page1 = conn.get("/3/discover/movie?page=1&api_key=#{ENV["TMDB_KEY"]}")
    page2 = conn.get("/3/discover/movie?page=2&api_key=#{ENV["TMDB_KEY"]}")

    json1 = JSON.parse(page1.body, symbolize_names: true)
    json2 = JSON.parse(page2.body, symbolize_names: true)

    results = json1[:results] + json2[:results]
    get_local_movies(results)
  end

  def self.get_local_movies(results)
    results.map do |movie_data|
      LocalMovie.new(movie_data)
    end
  end
  
  def find_top_movie_vote_average
    response = Faraday.get("https://api.themoviedb.org/3/discover/movie?api_key=54db8c6468269696f6e3cf41f6f27821")
    top_va = []
    JSON.parse(response.body, symbolize_names: true)[:results].each do |movie|
      top_va < movie[:vote_average]
    end
    top_va
  end
  
  def find_movies_by_name(search)
    name_search = params(:search).gsub(" ", "%20")
    titles = []
    response = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=54db8c6468269696f6e3cf41f6f27821&language=en-US&query=#{name_search}&page=1&include_adult=false")

    JSON.parse(response.body, symbolize_names: true)[:results].each do |movie|
      titles < movie[:title]
    end
    titles
  end
  
  def find_vote_average_by_name(search)
    name_search = params(:search).gsub(" ", "%20")

    va = []

    response = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=54db8c6468269696f6e3cf41f6f27821&language=en-US&query=#{name_search}&page=1&include_adult=false")

    JSON.parse(response.body, symbolize_names: true)[:results].each do |movie|
      va < movie[:vote_average]
    end
    va
  end
  
  def movie_params
    params.require(:movie).permit(:name, :super_name, :superpower_id, :search)
  end
end