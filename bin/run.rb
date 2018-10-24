require_relative '../config/environment'
require "pry"



  p "Hi, Welome to Flatiron Burger!"
  p "Make your own Burger"
  p "What is the name of the order?"
  name_input = gets.chomp
  new_burger = Burger.create(name: name_input)
  p new_burger

  new_burger.menu_output
  ing_input = gets.chomp.capitalize

  # comparing and finding a match instance of an ingredient
  new_ingredient = Ingredient.find_by(name: ing_input)
  p new_ingredient

  # creating a burger ingredient
  new_burger_ingredient = BurgerIngredient.create(burger: new_burger, ingredient: new_ingredient)
  p "Current Ingredients: #{new_burger.output_ingredient}"
  p new_burger.price
  binding.pry
  puts "Any more ingredients?"
  puts "Yes or No"

  answer_input = gets.chomp.downcase

  while answer_input == "yes"
    new_burger.menu_output
    ing_input = gets.chomp.capitalize
    # comparing and finding a match instance of an ingredient
    new_ingredient = Ingredient.find_by(name: ing_input)
    p new_ingredient

    # creating a burger ingredient
    new_burger_ingredient = BurgerIngredient.create(burger: new_burger, ingredient: new_ingredient)
    p new_burger.ingredients
    new_burger = Burger.all.find(new_burger.id)
    p new_burger.ingredients
    p "Current Ingredients: #{new_burger.output_ingredient}"
    p new_burger.price
    binding.pry

    puts "Any more ingredients?"
    puts "Yes or No"
    # binding.pry
    answer_input = gets.chomp.downcase
  end

  # if answer_input == "yes"
  #   new_burger.menu_output
  #   ing_input = gets.chomp.capitalize
  #   new_ingredient = Ingredient.find_by(name: ing_input)
  #   p new_ingredient

  #   new_burger_ingredient = BurgerIngredient.create(burger: new_burger, ingredient: new_ingredient)
  #   binding.pry
  #   p "Current Ingredients: #{new_burger.output_ingredient}"
  #   p new_burger.price

  # end










# ing_input = new_burger.menu_output
# new_ingredient = Ingredient.find_by(name: ing_input)
# new_burger_ingredient = BurgerIngredient.create(burger:new_burger, ingredient:new_ingredient)
# new_burger.output_ingredient
# new_burger.price


# if answer_input == "yes"
#   ing_input = new_burger.menu_output
#   new_ingredient = Ingredient.find_by(name: ing_input)
#   n_b_ingredient = BurgerIngredient.create(burger:new_burger, ingredient:new_ingredient)
#   p new_burger.output_ingredient
#   p new_burger.price
# elsif answer_input == "no"
#   puts "Here your Order!"
# else
#   puts "Not a known command, Please try again"
# end

# # p new_burger.ingredients.map{|ing|ing.name}
# # new_total_price = new_burger.ingredients.map{|ing| ing.price}.reduce(:+)

# # p "Your total price is #{new_total_price}"
# # # first we need to create burger_ingredient
# # #   the method burger.ingredients will return all ingredients in that specific burger

# # # new_burger_ingredient = BurgerIngredient.create(burger: new_burger, ingredient: typeAnIngredient)
# # # p new_burger_ingredient
