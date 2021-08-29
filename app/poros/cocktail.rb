class Cocktail
  attr_reader :name, :instructions, :image_url, :ingredient

  def initialize(info)
    @name = info[:name]
    @instructions = info[:instructions]
    @image_url = info[:image_url]
    @ingredient = info[:ingredient]
  end
end
