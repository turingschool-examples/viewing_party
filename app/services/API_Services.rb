class APIServices
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
end
