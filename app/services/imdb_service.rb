class ImdbService
  def self.top_movies_search(search)
    search_terms = search.gsub(' ', '+')
    response_1 = Faraday.get "https://api.themoviedb.org/3/search/movie?api_key=e1dce8b90f48a3084940ca941868f474&query=#{search_terms}&page=1"
    response_2 = Faraday.get "https://api.themoviedb.org/3/search/movie?api_key=e1dce8b90f48a3084940ca941868f474&query=#{search_terms}&page=2"
    body_1 = response_1.body
    body_2 = response_2.body
    ruby_body_1 = JSON.parse(body_1, symbolize_names: true)
    ruby_body_2 = JSON.parse(body_2, symbolize_names: true)
    ruby_body = ruby_body_1[:results].concat(ruby_body_2[:results])
    return 'No Movies Found' if ruby_body == []
    ruby_body.each_with_object([]) do |movie, array|
      array.push({title: movie[:title], vote: [:vote_average]})
    end
  end
  def self.top_movies
    response_1 = Faraday.get "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=e1dce8b90f48a3084940ca941868f474&page=1"
    response_2 = Faraday.get "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=e1dce8b90f48a3084940ca941868f474&page=2"
    body_1 = response_1.body
    body_2 = response_2.body
    ruby_body_1 = JSON.parse(body_1, symbolize_names: true)
    ruby_body_2 = JSON.parse(body_2, symbolize_names: true)
    ruby_body = ruby_body_1[:results].concat(ruby_body_2[:results])
    ruby_body.each_with_object([]) do |movie, array|
      array.push({title: movie[:title], vote: [:vote_average]})
    end
  end
end