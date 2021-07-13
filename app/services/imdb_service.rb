class ImdbService


# number_of_results_asked_for = 100
# results = []
# x=1
#   while number_of_results_asked_for > results.length
#     # movies = make api call to page x
#     # results << movies
#     # x +=1
#   end


  def self.top_movies_search(search)\
    imbd_api = ENV['IMDB_KEY']
    search_terms = search.gsub(' ', '+')
    response_1 = Faraday.get "https://api.themoviedb.org/3/search/movie?api_key=#{imbd_api}&query=#{search_terms}&page=1"
    response_2 = Faraday.get "https://api.themoviedb.org/3/search/movie?api_key=#{imbd_api}&query=#{search_terms}&page=2"
    body_1 = response_1.body
    body_2 = response_2.body
    ruby_body_1 = JSON.parse(body_1, symbolize_names: true)
    ruby_body_2 = JSON.parse(body_2, symbolize_names: true)
    ruby_body = ruby_body_1[:results].concat(ruby_body_2[:results])
    return 'No Movies Found' if ruby_body == []
    ruby_body.each_with_object([]) do |movie, array|
      array.push(Movie.new(movie[:title], movie[:vote_average], movie[:id]))
    end
  end
  def self.top_movies
    imbd_api = ENV['IMDB_KEY']
    response_1 = Faraday.get "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=#{imbd_api}&page=1"
    response_2 = Faraday.get "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=#{imbd_api}&page=2"
    body_1 = response_1.body
    body_2 = response_2.body
    ruby_body_1 = JSON.parse(body_1, symbolize_names: true)
    ruby_body_2 = JSON.parse(body_2, symbolize_names: true)
    ruby_body = ruby_body_1[:results].concat(ruby_body_2[:results])
    ruby_body.each_with_object([]) do |movie, array|
      array.push(Movie.new(movie[:title], movie[:vote_average], movie[:id]))
    end
  end
  def self.movie_data(movie_id)
    imbd_api = ENV['IMDB_KEY']
    response = Faraday.get "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{imbd_api}"
    body = response.body
    ruby_body = JSON.parse(body, symbolize_names: true)
    {title: ruby_body[:title], vote_average: ruby_body[:vote_average], runtime: ruby_body[:runtime], genres: ruby_body[:genres], overview: ruby_body[:overview], vote_count: ruby_body[:vote_count] }
  end
  def self.movie_cast(movie_id)
    imbd_api = ENV['IMDB_KEY']
    response = Faraday.get "https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=#{imbd_api}"
    body = response.body
    ruby_body = JSON.parse(body, symbolize_names: true)
    acting = []
    ruby_body[:cast].each do |credit|
      if credit[:known_for_department] == 'Acting'
        acting.push(credit[:name])
      end
    end
    acting[0..9]
  end
  def self.movie_reviews(movie_id)
    imbd_api = ENV['IMDB_KEY']
    response = Faraday.get "https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=#{imbd_api}"
    body = response.body
    ruby_body = JSON.parse(body, symbolize_names: true)
    ruby_body[:results].each_with_object([]) do |reviewer, array|
      array.push({name: reviewer[:author], review: reviewer[:content]})
    end
  end

  # def self.top_movies(search = nil)
  #   imbd_api = ENV['IMDB_KEY']
  #   if search == nil
  #     path = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=#{imbd_api}&page=#{page}"
  #     movie_object_array = []
  #     2.times do |index|
  #       page = index + 1
  #       response = Faraday.get path
  #       body = response.body
  #       ruby_body = JSON.parse(body, symbolize_names: true)
  #       ruby_body[:results].each do |movie|
  #         movie_object_array.push(Movie.new(movie[:title], movie[:vote_average]))
  #       end
  #     end
  #     movie_object_array
  #   else
  #     search_terms = search.gsub(' ', '+')
  #     path = "https://api.themoviedb.org/3/search/movie?api_key=#{imbd_api}&query=#{search_terms}&page=#{page}"
  #     movie_object_array = []
  #     2.times do |index|
  #       page = index + 1
  #       response = Faraday.get path
  #       body = response.body
  #       ruby_body = JSON.parse(body, symbolize_names: true)
  #       ruby_body[:results].each do |movie|
  #         movie_object_array.push(Movie.new(movie[:title], movie[:vote_average]))
  #       end
  #     end
  #     movie_object_array
  #   end
  # end
end
