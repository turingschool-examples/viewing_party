class MoviesFacade
  # def self.get_top_movies
  #   results = MoviesService.get_top_movies
  #   get_movies(results)
  # end

  # def self.find_top_movie_vote_average #parse in service
  #   response = MoviesService.find_top_movie_vote_average
  #   response.map do |movie|
  #     movie[:vote_average]
  #   end
  # end

  def self.find_movies_by_name(search)
    response = MoviesService.find_movies_by_name(search)
    get_movies(response)
  end

  # def self.find_vote_average_by_name(search)
  #   response = MoviesService.find_vote_average_by_name(search)
  #   reponse.map do |movie|
  #     movie[:vote_average]
  #   end
  # end

  def self.get_cast(id)
    response = MoviesService.get_cast(id) #parse in service
  end

  private

  def self.movie_params
    params.require(:movie).permit(:name, :super_name, :superpower_id, :search)
  end

  def self.get_movie_info(id)
    MoviesService.get_movie_info(id)
  end

  def self.get_movies(results)
    results.map do |movie_data|
      LocalMovie.new(movie_data)
    end
  end
end
