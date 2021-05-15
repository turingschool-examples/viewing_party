class Film
  attr_reader :title, :rating, :api_id, :runtime, :summary

  def initialize(details)
    @title = details[:title]
    @rating = details[:vote_average]
    @api_id = details[:id]
    @runtime = details[:runtime].to_i
    @genres = details[:genres]
    @summary = details[:overview]
  end

  def format_time(minutes)
    hours = minutes / 60
    minutes = (minutes) % 60
    "#{ hours }hr #{ minutes }min"
  end

  def genres
    @genres.map do |genre|
     genre[:name]
    end
  end

  def cast(cast_endpoint)
    cast = cast_endpoint[:cast]
    cast.map do |actor|
      "#{actor[:name]} as #{actor[:character]}"
    end.first(10)
  end

  # def reviews(review_endpoint)
  #   reviews = review_endpoint[:results]
  #   reviews.map do |reviewer|
  #     "Author: #{reviewer[:author]}""#{reviewer[:content]}"
  #   end
  # end

  def reviews(review_endpoint)
    reviews = review_endpoint[:results]
    authors = reviews.map do |reviewer|
      reviewer[:author]
    end

    content = reviews.map do |reviewer|
      reviewer[:content]
    end

    authors.zip(content)
  end
end
