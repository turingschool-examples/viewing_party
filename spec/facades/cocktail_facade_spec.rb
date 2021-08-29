require 'rails_helper'

 RSpec.describe CocktailFacade do
   it 'can gather ingredients for a cocktail' do
     drink_id = '11007'

     json_response = File.read('spec/fixtures/search_drink_id.json')

     stub_request(:get, "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{drink_id}").
     to_return(status: 200, body: json_response)

     expected = ["Tequila", "Triple sec", "Lime juice", "Salt"]

     expect(CocktailFacade.create_ingredients(drink_id )).to eq(expected)
   end

   it 'can gather drink proportions for ingredients' do
     drink_id = '11007'

     json_response = File.read('spec/fixtures/search_drink_id.json')

     stub_request(:get, "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{drink_id}").
     to_return(status: 200, body: json_response)

     expected = ["1 1/2 oz ", "1/2 oz ", "1 oz "]

     expect(CocktailFacade.create_proportions(drink_id )).to eq(expected)
   end

   it 'can create ingredients information' do
     drink_id = '11007'

     json_response = File.read('spec/fixtures/search_drink_id.json')

     stub_request(:get, "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{drink_id}").
     to_return(status: 200, body: json_response)

     expected = {
      "Tequila" => "1 1/2 oz ",
      "Triple sec" => "1/2 oz ",
      "Lime juice" => "1 oz ",
      "Salt" => nil
     }

     expect(CocktailFacade.create_ingredients_proportions(drink_id)).to eq(expected)
   end

   it 'can create drink information' do
     drink_id = '11007'

     json_response = File.read('spec/fixtures/search_drink_id.json')

     stub_request(:get, "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{drink_id}").
     to_return(status: 200, body: json_response)

     expected = {
       name: "Margarita",
       instructions: "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.",
       image_url: 'https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg',
       ingredients: {
        "Tequila" => "1 1/2 oz ",
        "Triple sec" => "1/2 oz ",
        "Lime juice" => "1 oz ",
        "Salt" => nil}}

      expect(CocktailFacade.drink_information(drink_id)).to eq(expected)
   end

   it 'can create a drink' do
     drink_id = '11007'

     json_response = File.read('spec/fixtures/search_drink_id.json')

     stub_request(:get, "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{drink_id}").
     to_return(status: 200, body: json_response)

     expect(CocktailFacade.create_drink(drink_id)).to be_an_instance_of(Cocktail)
   end
 end
