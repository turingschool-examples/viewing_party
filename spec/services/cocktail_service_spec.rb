require 'rails_helper'

RSpec.describe CocktailService do
  describe 'getting random cocktail' do
    xit 'can return a response from the cocktail database' do
      response = '{"drinks": [{"idDrink": "178356",
      "strDrink": "Butterfly Effect",
      "strCategory": "Cocktail",
      "strAlcoholic": "Alcoholic",
      "strGlass": "Hurricane glass",
      "strInstructions": "Grab your boston tin, fill it with cubes ice and then simply chuck in all your ingredients apart from your lemonade.\r\nNow it’s time to shake what your mama gave you until all your ingredients are blended to perfection.\r\nAdd some cubes of ice to your hurricane glass, give them a swill to cool the whole thing down and then strain your raspberry vodka cocktail of wonder into the glass.\r\nTop with lemonade and chuck a sprig of mint on top for garnish.\r\nYou can either get drinking at this point or go and try and grab a few butterflies to finish, the choice really is yours.",
      "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/ht3hnk1619704289.jpg",
      "strIngredient1": "Raspberry Vodka",
      "strIngredient2": "Cranberry Juice",
      "strIngredient3": "Lemonade",
      "strIngredient4": "Blue Curacao",
      "strIngredient5": "Sugar Syrup",
      "strIngredient6": "Lime Juice",
      "strIngredient7": "Mint",
      "strImageSource": "https://www.instagram.com/p/COQGZOXBOG2/",
      "strCreativeCommonsConfirmed": "No"}]}'

      allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(Faraday::Response.new)
      allow_any_instance_of(Faraday::Response).to receive(:body).and_return(response)

      cocktail_service = CocktailService.new

      expected = {idDrink: "178356",
      strDrink: "Butterfly Effect",
      strCategory: "Cocktail",
      strAlcoholic: "Alcoholic",
      strGlass: "Hurricane glass",
      strInstructions: "Grab your boston tin, fill it with cubes ice and then simply chuck in all your ingredients apart from your lemonade.\r\nNow it’s time to shake what your mama gave you until all your ingredients are blended to perfection.\r\nAdd some cubes of ice to your hurricane glass, give them a swill to cool the whole thing down and then strain your raspberry vodka cocktail of wonder into the glass.\r\nTop with lemonade and chuck a sprig of mint on top for garnish.\r\nYou can either get drinking at this point or go and try and grab a few butterflies to finish, the choice really is yours.",
      strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/ht3hnk1619704289.jpg",
      strIngredient1: "Raspberry Vodka",
      strIngredient2: "Cranberry Juice",
      strIngredient3: "Lemonade",
      strIngredient4: "Blue Curacao",
      strIngredient5: "Sugar Syrup",
      strIngredient6: "Lime Juice",
      strIngredient7: "Mint",
      strImageSource: "https://www.instagram.com/p/COQGZOXBOG2/",
      strCreativeCommonsConfirmed: "No"}

      expect(cocktail_service.get_random_cocktail).to eq(expected)
    end

    xit 'can search for a cocktail' do
      response = '{
        "drinks": [
        {
            "idDrink": "11728",
            "strDrink": "Martini",
            "strVideo": "https://www.youtube.com/watch?v=ApMR3IWYZHI",
            "strCategory": "Cocktail",
            "strIBA": "Unforgettables",
            "strAlcoholic": "Alcoholic",
            "strGlass": "Cocktail glass",
            "strInstructions": "Straight Pour all ingredients into mixing glass with ice cubes Stir well Strain in chilled martini cocktail glass Squeeze oil from lemon peel onto the drink, or garnish with olive",
            "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/71t8581504353095.jpg",
            "strIngredient1": "Gin",
            "strIngredient2": "Dry Vermouth",
            "strIngredient3": "Olive",
            "strMeasure1": "1 2/3 oz ",
            "strMeasure2": "1/3 oz ",
            "strMeasure3": "1 ",
        },
        {
            "idDrink": "11005",
            "strDrink": "Dry Martini",
            "strDrinkAlternate": null,
            "strTags": "IBA,Classic,Christmas,Alcoholic",
            "strVideo": null,
            "strCategory": "Cocktail",
            "strIBA": "Unforgettables",
            "strAlcoholic": "Alcoholic",
            "strGlass": "Cocktail glass",
            "strInstructions": "Straight Pour all ingredients into mixing glass with ice cubes Stir well Strain in chilled martini cocktail glass. Squeeze oil from lemon peel onto the drink, or garnish with olive",
            "strIngredient1": "Gin",
            "strIngredient2": "Dry Vermouth",
            "strIngredient3": "Olive"}]'

      allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(Faraday::Response.new)
      allow_any_instance_of(Faraday::Response).to receive(:body).and_return(response)

      expected = [{
            idDrink: "11007",
            strDrink: "Margarita",
            strTags: "IBA,ContemporaryClassic",
            strCategory: "Ordinary Drink",
            strIBA: "Contemporary Classics",
            strAlcoholic: "Alcoholic",
            strGlass: "Cocktail glass",
            strInstructions: "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.",
            strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg",
            strIngredient1: "Tequila",
            strIngredient2: "Triple sec",
            strIngredient3: "Lime juice",
            strIngredient4: "Salt",
            strMeasure1: "1 1/2 oz ",
            strMeasure2: "1/2 oz ",
            strMeasure3: "1 oz ",
            strImageSource: "https://commons.wikimedia.org/wiki/File:Klassiche_Margarita.jpg",
            strImageAttribution: "Cocktailmarler",
            strCreativeCommonsConfirmed: "Yes",},
            {idDrink: "12322",
            strDrink: "Strawberry Margarita",
            strCategory: "Ordinary Drink",
            strAlcoholic: "Alcoholic",
            strGlass: "Cocktail glass",
            strInstructions: "Rub rim of cocktail glass with lemon juice and dip rim in salt. Shake schnapps, tequila, triple sec, lemon juice, and strawberries with ice, strain into the saltrimmed glass, and serve.",
            strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/tqyrpw1439905311.jpg",
            strIngredient1: "Strawberry schnapps",
            strIngredient2: "Tequila",
            strIngredient3: "Triple sec",
            strIngredient4: "Lemon juice",
            strIngredient5: "Strawberries",
            strIngredient6: "Salt",
            strMeasure1: "1/2 oz ",
            strMeasure2: "1 oz ",
            strMeasure3: "1/2 oz ",
            strMeasure4: "1 oz ",
            strMeasure5: "1 oz "}]


      cocktail_service = CocktailService.new

      expect(cocktail_service.search_cocktail('Margarita')).to eq(expected)
    end
  end
end
