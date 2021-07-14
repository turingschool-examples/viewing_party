class MoviesFacade
  def self.search_by_movie_title(movie_title)
    json = APIServices.movie_title_query(movie_title)

    json[:results].map do |result_data|
      Film.new(result_data)
    end.first(40)
  end

  def self.top_rated
    json = APIServices.top_rated_query
    json.map do |result_data|
      Film.new(result_data)
    end
  end
end

#from services > facade > poros > controller
