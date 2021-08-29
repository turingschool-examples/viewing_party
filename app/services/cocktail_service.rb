class CocktailService < ApiService
  def get_random_cocktail
    response = get_data('https://www.thecocktaildb.com/api/json/v1/1/random.php').get

    get_json(response)[:drinks][0]
  end

  def search_cocktail(query)
    response = get_data("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{query}").get

    get_json(response)[:drinks]
  end


  def get_mocktail
    response = get_data("https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic").get

    get_json(response)[:drinks]
  end

  def get_drink(id)
    response = get_data("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{id}").get

    get_json(response)[:drinks][0]
  end
end
