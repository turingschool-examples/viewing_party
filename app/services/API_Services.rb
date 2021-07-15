class APIServices
  def self.top_rated_query
    response_pg_1 = conn.get("3/movie/top_rated?api_key=#{ENV['api_key']}&page=1")
    response_pg_2 = conn.get("3/movie/top_rated?api_key=#{ENV['api_key']}&page=2")

    pg_1_parsed = parse_json(response_pg_1)
    pg_2_parsed = parse_json(response_pg_2)

    pg_1_parsed[:results] + pg_2_parsed[:results]
  end

  def self.movie_title_query(movie_title)
    response = conn.get("3/search/movie?query=#{movie_title}")
    parse_json(response)
  end

  def self.title_vote_summary_genres_runtime(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['api_key']}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.cast_info(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=#{ENV['api_key']}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.reviewer_data(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=#{ENV['api_key']}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['api_key']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
