class Film
  attr_reader :id,
              :title,
              :rating,
              :popularity,
              :overview
  def initialize(result_data)
    @id = result_data[:id]
    @title = result_data[:title] #check to see if we'll need to capitalize, etc.
    @rating = result_data[:vote_average]
    @popularity = result_data[:popularity]
    @overview = result_data[:overview]
  end
end
