class Cocktail
  attr_reader :name, :instructions, :image_url, :ingredients

  def initialize(info)
    @name = info[:name]
    @instructions = info[:instructions]
    @image_url = info[:image_url]
    @ingredients = info[:ingredients]
  end
end
