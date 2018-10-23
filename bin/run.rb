require_relative '../config/environment'



p "Hi, Welome to Flatiron Burger!"
p "Make your own Burger"
p "What is the name of the order?"
name_input = gets.chomp
new_burger = Burger.create(name: name_input)
p new_burger


p "Type an ingredient"
puts "*****MENU******"
count = 0
puts Ingredient.all.map {|ing| "#{count += 1}. #{ing.name} -------- $#{ing.price}" }
ing_input = gets.chomp
ing_input = ing_input.capitalize

new_ingredient = Ingredient.find_by(name: ing_input)
p new_ingredient

n_b_ingredient = BurgerIngredient.create(burger:new_burger, ingredient:new_ingredient)

# p new_burger.ingredients.map{|ing|ing.name}
# total_price = new_burger.ingredients.map{|ing| ing.price}.reduce(:+)
p "Your price is #{n_b_ingredient.ingredient.price}"

puts "Anything else"
puts "Yes or No"
answer_input = gets.chomp.downcase

if answer_input == "yes"
  p "Type an ingredient"
  puts "*****MENU******"
  count = 0
  puts Ingredient.all.map {|ing| "#{count += 1}. #{ing.name} -------- $#{ing.price}" }
  second_input = gets.chomp
  second_input = second_input.capitalize

  second_ingredient = Ingredient.find_by(name: second_input)
  p second_ingredient

  BurgerIngredient.create(burger: new_burger, ingredient: second_ingredient)
elsif answer_input == "no"
  puts "Here your Order!"
else
  puts "Not a known command, Please try again"
end

p new_burger.ingredients.map{|ing|ing.name}
new_total_price = new_burger.ingredients.map{|ing| ing.price}.reduce(:+)

p "Your total price is #{new_total_price}"
# first we need to create burger_ingredient
#   the method burger.ingredients will return all ingredients in that specific burger

# new_burger_ingredient = BurgerIngredient.create(burger: new_burger, ingredient: typeAnIngredient)
# p new_burger_ingredient
















