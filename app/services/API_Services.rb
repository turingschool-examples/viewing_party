class APIServices

  # def get_top_rated_movies
  #   response_pg_1 = conn.get("3/movie/top_rated")
  #   parse_json(response)
  #
  #   response_pg_2 = conn.get("3/movie/top_rated&page=2")
  #   parse_json(response)
  # end
  #

  def self.movie_title_query(movie_title)
    response = conn.get("3/search/movie?query=#{search_movie}")
    parse_json(response)
  end


  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['MOVIES_DB_API_KEY']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.title_vote_summary_genres_runtime(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=" + ENV['api_key'])
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.cast_info(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=" + ENV['api_key'])
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.reviewer_data(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=" + ENV['api_key'])
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
