class MoviesFacade
  # def self.find_movie_title(title)
  # end

  def self.search_by_movie_title(movie_title)
    json = APIServices.movie_title_query(movie_title)
    json[:results.map do |result_data]
      Film.new(result_data)
    end.first(40)
  end

  # def self.create_movie_objects(movie_data_via_api)
  #   movie_data_via_api.map do |movie_data|
  #     Film.new(movie_data) #POROS
  # end
end

#from services > facade > poros > controller
