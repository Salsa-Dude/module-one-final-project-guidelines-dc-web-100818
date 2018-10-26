
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
Onion = Ingredient.create(name: "Onion", price: 0.25)
Egg = Ingredient.create(name: "Egg", price: 1.15)
Bacon = Ingredient.create(name: "Bacon", price: 1.50)
Pickles = Ingredient.create(name: "Pickles", price: 0.35)
Chicken = Ingredient.create(name: "Chicken", price: 2.00)
Avocado = Ingredient.create(name: "Avocado", price: 1.25)
Fries = Ingredient.create(name: "Fries", price: 2.25)
Sause = Ingredient.create(name: "Sause", price: 0.45)
Ham = Ingredient.create(name: "Ham", price: 0.75)
