class APIServices

  # def get_top_rated_movies
  #   response_pg_1 = conn.get("3/movie/top_rated")
  #   parse_json(response)
  #
  #   response_pg_2 = conn.get("3/movie/top_rated&page=2")
  #   parse_json(response)
  # end
  #
  def self.get_search_movie(search_movie)
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

  def self.movie_details(movie_id)
    response_1 = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=" + ENV['api_key'])
    response_2 = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=" + ENV['api_key'])
    response_3 = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=" + ENV['api_key'])
    json_1 = JSON.parse(response_1.body, symbolize_names: true)
    json_2 = JSON.parse(response_2.body, symbolize_names: true)
    json_3 = JSON.parse(response_3.body, symbolize_names: true)

    genres = json_1[:genres].map do |hash|
      hash[:name]
    end.join(', ')

    title = json_1[:original_title]

    vote_average = json_1[:vote_average]

    runtime = ("#{json_1[:runtime] / 60} Hours, " + "#{json_1[:runtime] % 60} Minutes")

    summary = json_1[:overview]

    cast = json_2[:cast].map do |hash|
      "Character: #{hash[:character]}, Played By: #{hash[:name]}"
    end

    first_ten_cast_members = cast[0..9]

    total_reviews = json_3[:results].count

    author_details = json_3[:results].map do |hash|
      hash[:author_details]
    end
    reviewer_info = author_details.map do |details|
      "Name: #{details[:name]}, Username: #{details[:username]}, Avatar Path: #{details[:avatar_path]}, Rating: #{details[:rating]}"
    end
  end
  require "pry"; binding.pry
end
