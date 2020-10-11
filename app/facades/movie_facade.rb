class MovieFacade

  def self.movie_details(movie_id)
    json = MovieService.get_details(movie_id)
    @movie = Movie.new(json)
  end

  def self.top_40
    json = MovieService.find_top_40
    @movies = json.map do |movie_data|
      movie = Movie.new(movie_data)
    end
  end

  def self.find(title)
    json = MovieService.find_title(title)
    @movies = json.map do |movie_data|
      movie = Movie.new(movie_data)
    end
  end

  
end