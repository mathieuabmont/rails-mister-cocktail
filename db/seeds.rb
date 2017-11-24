require 'json'
require 'open-uri'

Ingredient.destroy_all

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

unused_array = ingredients.first
array = unused_array[1]

my_ingredients = []

array.each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

Cocktail.create(name: 'Mojito')
Cocktail.create(name: 'Cuba Libre')
Cocktail.create(name: 'Spritz')
