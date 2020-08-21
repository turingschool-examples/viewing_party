class MovieIndexObject
  attr_reader :id, :title, :vote_average

  def initialize(info)
    @title = info[:title]
    @vote_average = info[:vote_average]
    @id = info[:id]
  end
end
