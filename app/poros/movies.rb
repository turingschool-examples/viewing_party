class Movies
  attr_reader :title

  def initialize(data)
    @title = data[:title].capitalize
  end

end
