class CocktailFacade
  @@service = CocktailService.new

  def self.create_ingredients(id)
    drink = @@service.get_drink(id)
    ingredients = []
    drink.each do |key, value|
      ingredients << value if key.start_with?('strIngredient') && !value.nil?
    end
    ingredients
  end

  def self.create_proportions(id)
    drink = @@service.get_drink(id)
    proportions = []
    drink.each do |key, value|
      proportions << value if key.start_with?('strMeasure') && !value.nil?
    end
    proportions
  end

  def self.create_ingredients_proportions(id)
    drink = @@service.get_drink(id)
    Hash[create_ingredients(id).zip(create_proportions(id))]
  end

  def self.drink_information(id)
    drink = @@service.get_drink(id)
    {
      name: drink[:strDrink],
      instructions: drink[:strInstructions],
      image_url: drink[:strDrinkThumb],
      ingredients: create_ingredients_proportions(id)
    }
  end

  def self.create_drink(id)
    Cocktail.new(drink_information(id))
  end
end
