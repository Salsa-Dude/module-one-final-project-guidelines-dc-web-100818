
require_relative "../app/models/burger.rb"
require_relative "../app/models/burgerIngredient.rb"
require_relative "../app/models/ingredient.rb"

burger1 = Burger.create(name: "Krabby Patty")
burger2 = Burger.create(name: "Double Krabby Patty")


lettace = Ingredient.create(name: "Lettace", 0.25)
meat = Ingredient.create(name: "Meat", 2.25)
tomato = Ingredient.create(name: "Tomato", 0.50)
cheese = Ingredient.create(name: "Cheese", 1.00)

BurgerIngredient.create(burger1, lettace)
BurgerIngredient.create(burger1, meat)
BurgerIngredient.create(burger2, cheese)
BurgerIngredient.create(burger2, meat)
BurgerIngredient.create(burger2, meat)


