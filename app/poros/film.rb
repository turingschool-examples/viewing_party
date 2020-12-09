class Film
  attr_reader :api_movie_id,
              :title,
              :rating,
              :cast,
              :reviews,
              :overview,
              :runtime_min,
              :similar,
              :recommendations

  def initialize(film_data)
    @api_movie_id = film_data[:id]
    @title = film_data[:title]
    @rating = film_data[:vote_average]
    @runtime_min = film_data[:runtime]
    @overview = film_data[:overview]
    @genres_array = film_data[:genres]
    @cast = cast_parse(film_data)
    @reviews = reviews_parse(film_data)
    @similar = similar_parse(film_data)
    @recommendations = recommendations_parse(film_data)
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
    film_info(film_data[:credits], Actor, :cast)
  end

  def reviews_parse(film_data)
    film_info(film_data[:reviews], Review, :results)
  end

  def similar_parse(film_data)
    film_info(film_data[:similar], Film, :results)
  end

  def recommendations_parse(film_data)
    film_info(film_data[:recommendations], Film, :results)
  end

  def film_info(attribute_data, object, key)
    return [] if attribute_data.nil?

    attribute_data[key].map do |data|
      object.new(data)
    end
  end
end
