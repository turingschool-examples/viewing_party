class MovieService

  def self.get_data(arg)
    conn = Faraday.get("https://api.themoviedb.org/3/#{arg}") do |request|
      request.params['api_key'] = ENV['MOVIE_DB_API']
      request.params['language'] = 'en-US'
    end
  end

  def self.find_top_40(page_number)
    response = MovieService.get_data("movie/top_rated?page=#{page_number}")
  end

  def self.get_top_rated
    movies = []
    x = 1
    until movies.size >= 40 do
      response = MovieService.find_top_40(x)
      parsed = JSON.parse(response.body, symbolize_names: true)
      parsed[:results].map do |film|
        movies << Film.new(film)
      end
      x += 1
    end
    movies[0..39]
  end

  def self.movie_details(movie_id)
    response = MovieService.get_data("/movie/#{movie_id}")
    parsed = JSON.parse(response.body, symbolize_names: true)
    FilmDetails.new(parsed)
  end

  def self.get_cast(movie_id)
    response = MovieService.get_data("movie/#{movie_id}/credits")
    parsed = JSON.parse(response.body, symbolize_names: true)
    parsed = parsed[:cast].first(10)
    Cast.new(parsed)
  end

  def self.get_reviews(movie_id)
    response = MovieService.get_data("movie/#{movie_id}/reviews")
    parsed = JSON.parse(response.body, symbolize_names: true)
    Review.new(parsed[:results])
  end


  def self.search_movies(title, page_number = 1)
    title = title.gsub(" ", "+")
    response = MovieService.get_data("search/movie?page=#{page_number}&query=#{title}")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.make_searched_movies(title)
    movies = []
    page_number = 1
    # unless search_movies(title, page_number).nil? || 0
      until movies.size >= 40 || movies.size == search_movies(title)[:total_results] do
        page_number += 1 if movies.count == 20
        search_movies(title, page_number)[:results].each do |movie_data|
          # break if movie_data.nil?
          movies << Film.new(movie_data)
        end
      end
    # end
    movies.take(40)
  end
end