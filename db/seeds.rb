
require_relative "../app/models/burger.rb"
require_relative "../app/models/burger_ingredient.rb"
require_relative "../app/models/ingredient.rb"

Burger.destroy_all
Ingredient.destroy_all
BurgerIngredient.destroy_all


# Ingredients
Lettuce = Ingredient.create(name: "Lettuce", price: 0.25)
Meat = Ingredient.create(name: "Meat", price: 2.25)
Tomato = Ingredient.create(name: "Tomato", price: 0.50)
Cheese = Ingredient.create(name: "Cheese", price: 1.00)
Onion = Ingredient.create(name: "Onion", price: 0.15)



