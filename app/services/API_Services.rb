class APIServices
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
end
