class Movie
  attr_reader :title, :vote, :id

  def initialize(title, vote, id)
    @title = title
    @vote = vote
    @id = id
  end
  
end