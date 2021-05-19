class MovieCast
  attr_reader :character,
              :name 

  def initialize(attributes)
    @character = attributes[:character]
    @name = attributes[:name]
  end
end