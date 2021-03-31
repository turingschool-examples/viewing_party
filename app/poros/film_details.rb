class FilmDetails
  attr_reader :title,
              :average,
              :summary,
              :runtime,
              :genres,
              :runtime_minutes,
              :image


  def initialize(data)
    @title = data[:title]
    @average = data[:vote_average]
    @summary = data[:overview]
    @runtime = time_conversion(data[:runtime])
    @genres = find_genres(data[:genres])
    @runtime_minutes = data[:runtime]
    @image = data[:poster_path]
  end

  def time_conversion(minutes)
    hours = minutes / 60
    rest = minutes % 60
    time = [hours, rest]
  end

  def find_genres(genres)
    genre_collection = ""
    genres.each{|g| genre_collection += "#{g[:name]}, "}
    genre_collection[0..-3]
  end
end
