
require_relative "../app/models/burger.rb"
require_relative "../app/models/burger_ingredient.rb"
require_relative "../app/models/ingredient.rb"

Burger.destroy_all
Ingredient.destroy_all
BurgerIngredient.destroy_all


# # Burger 1
# burger1 = Burger.create(name: "Hamburger")
# # Burger 2
# burger2 = Burger.create(name: "Cheese Hamburger")
# # Burger 3 
# burger3 = Burger.create(name: "Double Cheeseburger")
# # Burger 4
# burger4 = Burger.create(name: "Chicken Grilled Burger")

Ingredients
Lettuce = Ingredient.create(name: "Lettuce", price: 0.25)
Meat = Ingredient.create(name: "Meat", price: 2.25)
Tomato = Ingredient.create(name: "Tomato", price: 0.50)
Cheese = Ingredient.create(name: "Cheese", price: 1.00)
Onion = Ingredient.create(name: "Onion", price: 0.15)

# order1 = BurgerIngredient.create(burger: burger1, ingredient:lettuce)
# order2 = BurgerIngredient.create(burger: burger1, ingredient: meat)
# order3 = BurgerIngredient.create(burger: burger2, ingredient: cheese)
# order4 = BurgerIngredient.create(burger: burger2, ingredient: meat)
# order5 = BurgerIngredient.create(burger: burger2, ingredient: meat)


