class ImdbService
  # def self.top_movies_search(search)\
  #   imbd_api = ENV['IMDB_KEY']
  #   search_terms = search.gsub(' ', '+')
  #   response_1 = Faraday.get "https://api.themoviedb.org/3/search/movie?api_key=#{imbd_api}&query=#{search_terms}&page=1"
  #   response_2 = Faraday.get "https://api.themoviedb.org/3/search/movie?api_key=#{imbd_api}&query=#{search_terms}&page=2"
  #   body_1 = response_1.body
  #   body_2 = response_2.body
  #   ruby_body_1 = JSON.parse(body_1, symbolize_names: true)
  #   ruby_body_2 = JSON.parse(body_2, symbolize_names: true)
  #   ruby_body = ruby_body_1[:results].concat(ruby_body_2[:results])
  #   return 'No Movies Found' if ruby_body == []
  #   ruby_body.each_with_object([]) do |movie, array|
  #     array.push({title: movie[:title], vote: movie[:vote_average]})
  #   end
  # end
  # def self.top_movies
  #   imbd_api = ENV['IMDB_KEY']
  #   response_1 = Faraday.get "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=#{imbd_api}&page=1"
  #   response_2 = Faraday.get "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=#{imbd_api}&page=2"
  #   body_1 = response_1.body
  #   body_2 = response_2.body
  #   ruby_body_1 = JSON.parse(body_1, symbolize_names: true)
  #   ruby_body_2 = JSON.parse(body_2, symbolize_names: true)
  #   ruby_body = ruby_body_1[:results].concat(ruby_body_2[:results])
  #   ruby_body.each_with_object([]) do |movie, array|
  #     array.push({title: movie[:title], vote: movie[:vote_average]})
  #   end
  # end

  def self.top_movies(search = nil)
    imbd_api = ENV['IMDB_KEY']
    if search == nil
      path = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=#{imbd_api}&page=#{page}"
    else
      search_terms = search.gsub(' ', '+')
      path = "https://api.themoviedb.org/3/search/movie?api_key=#{imbd_api}&query=#{search_terms}&page=#{page}"
    end
    movie_object_array = []
    2.times |index| do
      page = index + 1
      response = Faraday.get path
      body = response.body
      ruby_body = JSON.parse(body, symbolize_names: true)
      ruby_body[:results].each do |movie|
        movie_object_array.push(Moive.new(movie[:title], movie[:vote_average]))
      end
    end
    return movie_object_array
  end
end
