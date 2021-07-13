class MoviesFacade
  # def self.find_movie_title(title)
  # end

  def self.search_by_movie
    APIServices.get_search_movie(search_movie)[:results]
  end

  def self.create_movie_objects(movie_data_via_api)
    movie_data_via_api.map do |movie_data|
      Film.new(movie_data) #POROS
  end
end

#from services > facade > poros > controller
