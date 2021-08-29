require 'rails_helper'

RSpec.describe CocktailService do
  describe 'getting random cocktail' do
    before(:each) do
      @cocktail_service = CocktailService.new
    end

    it 'can return a response from the cocktail database' do
      json_response = File.read('spec/fixtures/random_cocktail.json')

      stub_request(:get, 'https://www.thecocktaildb.com/api/json/v1/1/random.php').
      to_return(status: 200, body: json_response)

      expect(@cocktail_service.get_random_cocktail).to have_key(:strDrink)
      expect(@cocktail_service.get_random_cocktail).to have_key(:strInstructions)
      expect(@cocktail_service.get_random_cocktail).to have_key(:strDrinkThumb)
      expect(@cocktail_service.get_random_cocktail).to have_key(:strIngredient1)
    end

    it 'can search for a cocktail' do
      json_response = File.read('spec/fixtures/search_cocktail.json')

      stub_request(:get, 'https://www.thecocktaildb.com/api/json/v1/1/random.php').
      to_return(status: 200, body: json_response)

      expect(@cocktail_service.get_random_cocktail).to have_key(:strDrink)
      expect(@cocktail_service.get_random_cocktail).to have_key(:strInstructions)
      expect(@cocktail_service.get_random_cocktail).to have_key(:strDrinkThumb)
      expect(@cocktail_service.get_random_cocktail).to have_key(:strIngredient1)
    end

    it 'can search non-alcohol beverages' do
      json_response = File.read('spec/fixtures/mocktail.json')

      stub_request(:get, 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic').
      to_return(status: 200, body: json_response)

      json = @cocktail_service.get_mocktail[0]

      expect(json).to have_key(:strDrink)
      expect(json).to have_key(:strDrinkThumb)
      expect(json).to have_key(:idDrink)
    end

    it 'can return drink details by given drink id' do
      drink_id = '11007'
      json_response = File.read('spec/fixtures/search_drink_id.json')

      stub_request(:get, "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{drink_id}").
      to_return(status: 200, body: json_response)

      expect(@cocktail_service.get_drink(drink_id)).to have_key(:strDrink)
      expect(@cocktail_service.get_drink(drink_id)).to have_key(:strInstructions)
      expect(@cocktail_service.get_drink(drink_id)).to have_key(:strDrinkThumb)
      expect(@cocktail_service.get_drink(drink_id)).to have_key(:strIngredient1)
    end
  end
end
