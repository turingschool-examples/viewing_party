class Genre
  attr_reader :id,
              :name
              
  def initialize(genre_data)
    @id = genre_data[:id]
    @name = genre_data[:name]
  end
end