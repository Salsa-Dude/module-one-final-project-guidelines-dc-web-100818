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
puts '
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
  p "Build your own Burger"
  p "What is the name for the order?"
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
  puts "CURRENT INGREDIENTS: #{new_burger.output_ingredient}"
  p new_burger.price
  # binding.pry
  else
  p "Sorry, we don't have that."
  end
  puts "Any more ingredients?"
  puts "Yes or No"

  answer_input = gets.chomp.downcase
  while answer_input != "yes" && answer_input != "no"
    puts "Please enter yes or no!"
    answer_input = gets.chomp.downcase
  end

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

      p "CURRENT INGREDIENTS: #{new_burger.output_ingredient}"
      p new_burger.price
    else
      p "Sorry, we don't have that."
    end

    puts "Any more ingredients?"
    puts "Yes or No"
    # binding.pry
    answer_input = gets.chomp.downcase
    while answer_input != "yes" && answer_input != "no"
      puts "Please enter yes or no!"
      answer_input = gets.chomp.downcase
    end
  end

  if answer_input == "no"
    puts "Do you want to update the order?"
    puts "Yes or No"
    order_input = gets.chomp.downcase
    while order_input != "yes" && order_input != "no"
      puts "Please enter yes or no!"
      order_input = gets.chomp.downcase
    end
    case order_input
    when "no"
      puts ' 
       _    _               _                                              _           _ 
      | |  | |             ( )                                            | |         | |
      | |__| | ___ _ __ ___|/ ___   _   _  ___  _   _ _ __    ___  _ __ __| | ___ _ __| |
      |  __  |/ _ \  __/ _ \ / __| | | | |/ _ \| | | |  __|  / _ \|  __/ _` |/ _ \  __| |
      | |  | |  __/ | |  __/ \__ \ | |_| | (_) | |_| | |    | (_) | | | (_| |  __/ |  |_|
      |_|  |_|\___|_|  \___| |___/  \__, |\___/ \__,_|_|     \___/|_|  \__,_|\___|_|  ( )
                                     __/ |                                               
                                    |___/                                               
      '
      puts new_burger.total_price
      puts  '
         _....----"""----...._
      .-"  o    o    o    o   "-.
     /  o    o    o         o    \
    /     o      o   o     o    o \
  _|   o   o    o      o  o     o  |_
 / `""-----.................-----""` \
 \___________________________________/
   \~`-`.__.`-~`._.~`-`~.-~.__.~`-`/
    \                             /
     `-._______________________.-"

      '
    when "yes"
      puts "Do you want to ADD or DELETE an ingredient?"
      puts "Type no if neither"
      ingredient_input = gets.chomp.downcase
      while ingredient_input != "add" && ingredient_input != "delete" && ingredient_input != "no"
        puts "Please enter add or delete or no."
        ingredient_input = gets.chomp.downcase
      end
      case ingredient_input
      when "add"
        new_burger.menu_output
        ing_input = gets.chomp.capitalize
        # comparing and finding a match instance of an ingredient
        new_ingredient = Ingredient.find_by(name: ing_input)
        p new_ingredient

        # creating a burger ingredient
        new_burger_ingredient = BurgerIngredient.create(burger: new_burger, ingredient: new_ingredient)
        new_burger = Burger.all.find(new_burger.id)
        p "CURRENT INGREDIENTS: #{new_burger.output_ingredient}"
        p new_burger.price

        puts "Any more ingredients?"
        puts "Yes or No"
        answer_input = gets.chomp.downcase
        while answer_input != "yes" && answer_input != "no"
            puts "Please enter yes or no!"
            answer_input = gets.chomp.downcase
          end
        while answer_input == "yes"
          new_burger.menu_output
          ing_input = gets.chomp.capitalize
          # comparing and finding a match instance of an ingredient
          new_ingredient = Ingredient.find_by(name: ing_input)
          p new_ingredient

          # creating a burger ingredient
          new_burger_ingredient = BurgerIngredient.create(burger: new_burger, ingredient: new_ingredient)
          new_burger = Burger.all.find(new_burger.id)
          p "CURRENT INGREDIENTS: #{new_burger.output_ingredient}"
          p new_burger.price

          puts "Any more ingredients?"
          puts "Yes or No"
          answer_input = gets.chomp.downcase
        end
        if answer_input == "no"
          puts ' 
      
       _    _               _                                              _           _ 
      | |  | |             ( )                                            | |         | |
      | |__| | ___ _ __ ___|/ ___   _   _  ___  _   _ _ __    ___  _ __ __| | ___ _ __| |
      |  __  |/ _ \  __/ _ \ / __| | | | |/ _ \| | | |  __|  / _ \|  __/ _` |/ _ \  __| |
      | |  | |  __/ | |  __/ \__ \ | |_| | (_) | |_| | |    | (_) | | | (_| |  __/ |  |_|
      |_|  |_|\___|_|  \___| |___/  \__, |\___/ \__,_|_|     \___/|_|  \__,_|\___|_|  ( )
                                     __/ |                                               
                                    |___/                                               
      
      '

      puts new_burger.total_price
          puts  '
         _....----"""----...._
      .-"  o    o    o    o   "-.
     /  o    o    o         o    \
    /     o      o   o     o    o \
  _|   o   o    o      o  o     o  |_
 / `""-----.................-----""` \
 \___________________________________/
   \~`-`.__.`-~`._.~`-`~.-~.__.~`-`/
    \                             /
     `-._______________________.-"

      '
        end
      when "delete"
        new_burger.menu_output
        p "CURRENT INGREDIENTS: #{new_burger.output_ingredient}"
        ing_input = gets.chomp.capitalize
        # comparing and finding a match instance of an ingredient
        find_ingredient = Ingredient.find_by(name: ing_input)
        new_burger.delete_ingredient(find_ingredient)
        p "CURRENT INGREDIENTS: #{new_burger.output_ingredient}"

        puts "Delete any more ingredients?"
        puts "Yes or No"
        answer_input = gets.chomp.downcase

        while answer_input == "yes"
          new_burger.menu_output
          p "CURRENT INGREDIENTS: #{new_burger.output_ingredient}"
          ing_input = gets.chomp.capitalize

          # comparing and finding a match instance of an ingredient
          find_ingredient = Ingredient.find_by(name: ing_input)
          new_burger.delete_ingredient(find_ingredient)
          p "CURRENT INGREDIENTS: #{new_burger.output_ingredient}"

          # If ingredients don't have any ingredients return order
          if new_burger.ingredients.empty? == true
            return puts "Here's your Order!"
          end

          puts "Delete any more ingredients?"
          puts "Yes or No"
          answer_input = gets.chomp.downcase
        end
        if answer_input == "no"
          puts ' 
      
       _    _               _                                              _           _ 
      | |  | |             ( )                                            | |         | |
      | |__| | ___ _ __ ___|/ ___   _   _  ___  _   _ _ __    ___  _ __ __| | ___ _ __| |
      |  __  |/ _ \  __/ _ \ / __| | | | |/ _ \| | | |  __|  / _ \|  __/ _` |/ _ \  __| |
      | |  | |  __/ | |  __/ \__ \ | |_| | (_) | |_| | |    | (_) | | | (_| |  __/ |  |_|
      |_|  |_|\___|_|  \___| |___/  \__, |\___/ \__,_|_|     \___/|_|  \__,_|\___|_|  ( )
                                     __/ |                                               
                                    |___/                                               
      
      '
          puts  '
         _....----"""----...._
      .-"  o    o    o    o   "-.
     /  o    o    o         o    \
    /     o      o   o     o    o \
  _|   o   o    o      o  o     o  |_
 / `""-----.................-----""` \
 \___________________________________/
   \~`-`.__.`-~`._.~`-`~.-~.__.~`-`/
    \                             /
     `-._______________________.-"

      '
        end


      when "no"
        puts ' 
      
       _    _               _                                              _           _ 
      | |  | |             ( )                                            | |         | |
      | |__| | ___ _ __ ___|/ ___   _   _  ___  _   _ _ __    ___  _ __ __| | ___ _ __| |
      |  __  |/ _ \  __/ _ \ / __| | | | |/ _ \| | | |  __|  / _ \|  __/ _` |/ _ \  __| |
      | |  | |  __/ | |  __/ \__ \ | |_| | (_) | |_| | |    | (_) | | | (_| |  __/ |  |_|
      |_|  |_|\___|_|  \___| |___/  \__, |\___/ \__,_|_|     \___/|_|  \__,_|\___|_|  ( )
                                     __/ |                                               
                                    |___/                                               
      
      '
        puts  '
         _....----"""----...._
      .-"  o    o    o    o   "-.
     /  o    o    o         o    \
    /     o      o   o     o    o \
  _|   o   o    o      o  o     o  |_
 / `""-----.................-----""` \
 \___________________________________/
   \~`-`.__.`-~`._.~`-`~.-~.__.~`-`/
    \                             /
     `-._______________________.-"

      '
      end
    end
  end
