class Movie
  attr_reader :title, :vote

  def initialize(title, vote)
    @title = title
    @vote = vote
  end
  
end