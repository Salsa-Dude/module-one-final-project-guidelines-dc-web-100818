require_relative '../config/environment'
require "pry"

puts  '
 ______ _       _   _                   ____
|  ____| |     | | (_)                 |  _ \
| |__  | | __ _| |_ _ _ __ ___  _ __   | |_) |_   _ _ __ __ _  ___ _ __
|  __| | |/ _` | __| |  __/ _ \| _ \  |  _ <| | | |  __/ _` |/ _ \  __|
| |    | | (_| | |_| | | | (_) | | | | | |_) | |_| | | | (_| |  __/ |
|_|    |_|\__,_|\__|_|_|  \___/|_| |_| |____/ \__,_|_|  \__, |\___|_|
                                                         __/ |
                                                        |___/
'
print '
      /
   .-/-.
   | - |
   |   |
   |   |   .-""""-.
   \___/  /  .   . \   \|/\//
         (`-..:...- )  |`""`|
          ;-......-;   |    |
           "------"    \____/

'
  p "Hi, Welome to Flatiron Burger!"
  p "Make your own Burger"
  p "What is the name of the order?"
  name_input = gets.chomp
  new_burger = Burger.create(name: name_input)
  p new_burger

  new_burger.menu_output
  ing_input = gets.chomp.capitalize

  # while Ingredient.all.map{|ing|ing.name}.include?ing_input

  # comparing and finding a match instance of an ingredient
  new_ingredient = Ingredient.find_by(name: ing_input)
  if new_ingredient
  p new_ingredient

  # creating a burger ingredient
  new_burger_ingredient = BurgerIngredient.create(burger: new_burger, ingredient: new_ingredient)
  p "Current Ingredients: #{new_burger.output_ingredient}"
  p new_burger.price
  # binding.pry
else
  p "Sorry, we don't have that."
end
  puts "Any more ingredients?"
  puts "Yes or No"

  answer_input = gets.chomp.downcase


  while answer_input == "yes"
    new_burger.menu_output
    ing_input = gets.chomp.capitalize
    # comparing and finding a match instance of an ingredient
    new_ingredient = Ingredient.find_by(name: ing_input)

    if new_ingredient
      p new_ingredient


      # creating a burger ingredient
      new_burger_ingredient = BurgerIngredient.create(burger: new_burger, ingredient: new_ingredient)

      new_burger = Burger.all.find(new_burger.id)

      # binding.pry

      p "Current Ingredients: #{new_burger.output_ingredient}"
      p new_burger.price
    else
      p "Sorry, we don't have that."
    end

    puts "Any more ingredients?"
    puts "Yes or No"
    # binding.pry
    answer_input = gets.chomp.downcase
  end
# end
