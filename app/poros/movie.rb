class Movie

  def self.get_movies
    movie_service = MovieService.new
    movie_info = movie_service.get_top_rated

    @movies = movie_info.map do |movie|
      Movie.new(movie)
    end
  end

  def self.search(keywords)
    movie_service = MovieService.new
    movie_info = movie_service.search(keywords)

    @movies = movie_info.map do |movie|
      Movie.new(movie)
    end
  end

  def self.details(id)
    movie_service = MovieService.new
    movie_info = movie_service.details(id)
    movie = Movie.new(movie_info)
  end

  def self.cast(id)
    movie_service = MovieService.new
    cast = movie_service.cast(id)
    cast[:cast].first(10)
  end


  attr_reader :original_title,
              :vote_average,
              :id,
              :summary,
              :runtime

  def initialize(movie_info)
    @original_title = movie_info[:original_title]
    @vote_average = movie_info[:vote_average]
    @id = movie_info[:id]
    @genres = movie_info[:genres]
    @summary = movie_info[:overview]
    @runtime = movie_info[:runtime]
  end

  def genre_names
    results = ""
    @genres.map do |genre|
      results << genre[:name] + ", "
    end
    results.chomp(", ")
  end

end
