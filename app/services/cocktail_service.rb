class CocktailService < ApiService
  def get_random_cocktail
    response = get_data('www.thecocktaildb.com/api/json/v1/1/random.php').get

    get_json(response)[:drinks][0]
  end

  def search_cocktail(query)
    response = get_data("www.thecocktaildb.com/api/json/v1/1/search.php?s=#{query}").get

    get_json(response)[:drinks]
  end
end
# www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita
