class MoviesService
  def self.conn
    @@conn ||= Faraday.new(url: "https://api.themoviedb.org/3")
  end

  def self.get_top_movies
    page1 = conn.get("discover/movie?page=1&api_key=#{ENV["TMDB_KEY"]}")
    page2 = conn.get("discover/movie?page=2&api_key=#{ENV["TMDB_KEY"]}")

    json1 = json_parse(page1)
    json2 = json_parse(page2)

    json1[:results] + json2[:results]
  end

  def self.find_top_movie_vote_average
    response = conn.get("discover/movie?api_key=#{ENV["TMDB_KEY"]}")
    json_parse(response)
  end

  def self.find_movies_by_name(search)
    response_1 = conn.get("search/movie?api_key=#{ENV["TMDB_KEY"]}&language=en-US&page=1&query=#{name_search(search)}&page=1&include_adult=false")
    response_2 = conn.get("search/movie?api_key=#{ENV["TMDB_KEY"]}&language=en-US&page=2&query=#{name_search(search)}&page=1&include_adult=false")

    json1 = json_parse(response_1)
    json2 = json_parse(response_2)

    json1[:results] + json2[:results]
  end

  def self.find_vote_average_by_name(search)
    response = conn.get("search/movie?api_key=#{ENV["TMDB_KEY"]}&language=en-US&query=#{name_search(search)}&page=1&include_adult=false")
    json_parse(response)
  end

  def self.get_movie_info(id)
    response = conn.get("discover/movie/#{id}?api_key=#{ENV["TMDB_KEY"]}")
    json_parse(response)
  end

  def self.get_cast(id)
    response = conn.get("movie/#{id}/credits?api_key=#{ENV["TMDB_KEY"]}")
    json = json_parse(response)
    json[:cast][0..9]
  end

  private

  def self.json_parse (response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.name_search(search)
    search.gsub(" ", "%20")
  end
end
