class Film
  attr_reader :api_movie_id,
              :title,
              :rating,
              :cast,
              :reviews,
              :overview,
              :runtime_min

  def initialize(film_data)
    @api_movie_id = film_data[:id]
    @title = film_data[:title]
    @rating = film_data[:vote_average]
    @runtime_min = film_data[:runtime]
    @overview = film_data[:overview]
    @genres_array = film_data[:genres]
    @cast = cast_parse(film_data)
    @reviews = reviews_parse(film_data)
  end

  def runtime_display
    "#{@runtime_min / 60} hrs #{@runtime_min % 60} min" unless @runtime_min.nil?
  end

  def genres
    return if @genres_array.nil?

    @genres_array.map do |genre|
      genre[:name]
    end.join(', ')
  end

  def cast_parse(film_data)
    if film_data[:credits]
      film_info(film_data[:credits][:cast], Actor)
    else
      []
    end
  end

  def reviews_parse(film_data)
    if film_data[:reviews]
      film_info(film_data[:reviews][:results], Review)
    else
      []
    end
  end

  def film_info(attribute_data, object)
    return if attribute_data.nil?

    attribute_data.map do |data|
      object.new(data)
    end
  end
end
