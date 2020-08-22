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


  attr_reader :original_title,
              :vote_average

  def initialize(movie_info)
    @original_title = movie_info[:original_title]
    @vote_average = movie_info[:vote_average]
  end
end
