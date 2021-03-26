class Film
  attr_reader :title,
              :average
  
  def initialize(data)
    @title   = data[:title]
    @average = data[:vote_average]
  end

end


