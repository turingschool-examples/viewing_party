class Film
  attr_reader :title,
              :average,
              :id
  
  def initialize(data)
    @title    = data[:title]
    @average  = data[:vote_average]
    @id       = data[:id]
  end

end


