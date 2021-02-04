class Movies
  attr_reader :title

  def initialize(data)
    # require 'pry'; binding.pry
    # @title = data
    # @title = data[0][:title].capitalize
    @title = data[:results][0][:title].capitalize
  end

end

# acces the hash incorrectly: page > results
# rails app is not Movie.new is not working initializing properlly