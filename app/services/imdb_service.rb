class ImdbService
  def self.top_movies(search = nil)
    imbd_api = ENV['IMDB_KEY']
    if search != nil
      search_terms = search.gsub(' ', '+')
      two_pages = [con.get("/search/movie?api_key=#{imbd_api}&query=#{search_terms}&page=1"),
        con.get("/search/movie?api_key=#{imbd_api}&query=#{search_terms}&page=2")]
    else
      two_pages = [con.get("/discover/movie?sort_by=popularity.desc&api_key=#{imbd_api}&page=1"),
        (con.get"/discover/movie?sort_by=popularity.desc&api_key=#{imbd_api}&page=2")]
    end
    require 'pry', binding.pry
    two_pages.map do |page_results|
      body = two_pages.body
      JSON.parse(body, symbolize_names: true)[:results]
    end.flatten
  end
  
  def self.movie_data(movie_id)
    imbd_api = ENV['IMDB_KEY']
    response = con.get "/movie/#{movie_id}?api_key=#{imbd_api}"
    body = response.body
    ruby_body = JSON.parse(body, symbolize_names: true)
    {title: ruby_body[:title], vote_average: ruby_body[:vote_average], runtime: ruby_body[:runtime], genres: ruby_body[:genres], overview: ruby_body[:overview], vote_count: ruby_body[:vote_count] }
  end
  def self.movie_cast(movie_id)
    imbd_api = ENV['IMDB_KEY']
    response = con.get "/movie/#{movie_id}/credits?api_key=#{imbd_api}"
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
    response = con.get "zzmovie/#{movie_id}/reviews?api_key=#{imbd_api}"
    body = response.body
    ruby_body = JSON.parse(body, symbolize_names: true)
    ruby_body[:results].each_with_object([]) do |reviewer, array|
      array.push({name: reviewer[:author], review: reviewer[:content]})
    end
  end

  private

  def self.con
    Faraday.new(url: 'https://api.themoviedb.org/3')
  end

  def imbd_api
    ENV['IMDB_KEY']
  end
end
