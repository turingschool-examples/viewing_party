class Film
  attr_reader :title, :rating, :api_id

  def initialize(details)
    @title = details[:title]
    @rating = details[:vote_average]
    @api_id = details[:id]
  end
end
