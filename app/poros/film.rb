class Film
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :summary

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
  end

  def genre_names
    @genres.map do |genre|
      genre[:name]
    end.join(', ')
  end

  def runtime_hours_mins
    hours = @runtime / 60
    mins = @runtime % 60
    "#{hours}hr(s) #{mins}mins"
  end
end
