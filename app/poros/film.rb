class Film
  attr_reader :title, :rating, :api_id, :runtime, :genres, :summary

  def initialize(details)
    @title = details[:title]
    @rating = details[:vote_average]
    @api_id = details[:id]
    @runtime = details[:runtime].to_i
    @genres = details[:genres].map do |genre|
      genre[:name]
    end
    @summary = details[:overview]
  end

  def format_time(minutes)
    hours = minutes / 60
    minutes = (minutes) % 60
    "#{ hours }hr #{ minutes }min"
  end
end
