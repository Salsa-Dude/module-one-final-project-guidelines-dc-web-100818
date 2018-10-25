require_relative '../config/environment'
require "pry"

class Order 

  def begin 
    puts  '
    ______ _        _   _                   ____
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

    hello_message = "Hi, Welome to Flatiron Burger!"
    `say -v "victoria" #{hello_message}`
    puts "Build your own Burger"
    puts "What is the name for the order?"
    name_input = gets.chomp
    new_burger = Burger.create(name: name_input)
    p new_burger

    # outputs menu and get user input
    new_burger.menu_output
    ing_input = gets.chomp.capitalize

    # comparing and finding a match instance of an ingredient from user input
    new_ingredient = Ingredient.find_by(name: ing_input)
    
    # testing to see if new_ingredient exists
    # if true create a burger ingredient
    # if false output error message and ask user for input again
    if new_ingredient
      p new_ingredient
      new_burger_ingredient = BurgerIngredient.create(burger: new_burger, ingredient: new_ingredient)
      new_burger.display_both_current_price
    else
    p "Sorry, we don't have that. Please choose an ingredient to add"
    end

    # ask user if they want to add any more ingredients
    puts "Any more ingredients?"
    puts "Yes or No"

    # get user input
    answer_input = gets.chomp.downcase
    
    # checks to see if user input is not a yes or no
    # wil ask user input again if true
    while answer_input != "yes" && answer_input != "no"
      puts "Please enter yes or no!"
      answer_input = gets.chomp.downcase
    end

    # If user types "yes"
    while answer_input == "yes"

      # display menu and get user input
      new_burger.menu_output
      ing_input = gets.chomp.capitalize
      
      # comparing and finding a match instance of an ingredient
      new_ingredient = Ingredient.find_by(name: ing_input)

      # testing to see if new_ingredient exists
      # if false output error message and ask user for input again
      if new_ingredient
        p new_ingredient
        
        # creating a burger ingredient
        new_burger_ingredient = BurgerIngredient.create(burger: new_burger, ingredient: new_ingredient)
        new_burger = Burger.all.find(new_burger.id)
        
        # display current ingredients and current total price
        new_burger.display_both_current_price
      else
        p "Sorry, we don't have that."
      end

      # ask user if they want to add any more ingredients
      puts "Any more ingredients?"
      puts "Yes or No"
    
      answer_input = gets.chomp.downcase
      
      # checks to see if user input is not a yes or no
      # wil ask user input again if true
      while answer_input != "yes" && answer_input != "no"
        puts "Please enter yes or no!"
        answer_input = gets.chomp.downcase
      end
    end

    # User types "no"
    if answer_input == "no"
      puts "Do you want to update the order?"
      puts "Yes or No"
      order_input = gets.chomp.downcase
      
      # checks to see if user input is not a yes or no
      # wil ask user input again if true
      while order_input != "yes" && order_input != "no"
        puts "Please enter yes or no!"
        order_input = gets.chomp.downcase
      end
      
      # check user's input
      case order_input
      # when user types "no"
      when "no"
        # display order summary
        new_burger.return_order
        
        # ask user if they want to make another order
        puts "Want to make another order?"
        puts "Yes or No"
        another_order_input = gets.chomp.downcase

        # if "yes" start new order
        if another_order_input == "yes"
          return Order.new.begin
        else
          return
        end
      # when user types "yes"
      # ask user if they want to add or delete a ingredient
      when "yes"
        puts "Do you want to ADD or DELETE an ingredient?"
        puts "Type no if neither"
        ingredient_input = gets.chomp.downcase

        # checks to see if user input is not a "add", "delete" or "no"
        # wil ask user input again if true
        while ingredient_input != "add" && ingredient_input != "delete" && ingredient_input != "no"
          puts "Please enter add or delete or no."
          ingredient_input = gets.chomp.downcase
        end
        
        # check user's input
        case ingredient_input
          # when user types "add"
        when "add"
          # display menu and get user input
          new_burger.menu_output
          ing_input = gets.chomp.capitalize
          
          # comparing and finding a match instance of an ingredient from user input
          new_ingredient = Ingredient.find_by(name: ing_input)
          p new_ingredient

          # creating a burger ingredient
          new_burger_ingredient = BurgerIngredient.create(burger: new_burger, ingredient: new_ingredient)
          new_burger = Burger.all.find(new_burger.id)
          p "CURRENT INGREDIENTS: #{new_burger.output_ingredient}"
          p new_burger.price

          puts "Add any more ingredients?"
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
            
            # display current ingredients and current total price
            new_burger.display_both_current_price

            puts "Add any more ingredients?"
            puts "Yes or No"
            answer_input = gets.chomp.downcase
          end
          
          # when user types "no"
          if answer_input == "no"
            # display order summary
            new_burger.return_order

            # ask user if they want to make another order
            # if yes, restart order
            puts "Want to make another order?"
            puts "Yes or No"
            another_order_input = gets.chomp.downcase
            if another_order_input == "yes"
              Order.new.begin
            else
              return
            end
          end
        when "delete"
          # display menu and get user input
          new_burger.menu_output

          # display current ingredients and current total price
          new_burger.display_both_current_price

          puts "Type which ingredient do you want to delete?"
          
          ing_input = gets.chomp.capitalize
          
          # comparing and finding a match instance of an ingredient from user input
          find_ingredient = Ingredient.find_by(name: ing_input)

          # delete ingredient
          new_burger.delete_ingredient(find_ingredient)

          puts "Delete any more ingredients?"
          puts "Yes or No"
          answer_input = gets.chomp.downcase

          while answer_input == "yes"
            # display menu
            new_burger.menu_output
            
            # display current ingredients and current total price
            new_burger.display_both_current_price
            
            ing_input = gets.chomp.capitalize

            # comparing and finding a match instance of an ingredient from user input
            find_ingredient = Ingredient.find_by(name: ing_input)

            # delete ingredient
            new_burger.delete_ingredient(find_ingredient)
            
             # display current ingredients and current total price
            new_burger.display_both_current_price

            # If ingredients don't have any ingredients return order
            if new_burger.ingredients.empty? == true
              # display order summary
              new_burger.return_order

              # ask user if they want to make another order
              # if yes, restart order
              puts "Want to make another order?"
              puts "Yes or No"
              another_order_input = gets.chomp.downcase
              
              if another_order_input == "yes"
                Order.new.begin
              else
                return
              end
            end

            puts "Delete any more ingredients?"
            puts "Yes or No"
            answer_input = gets.chomp.downcase
          end
          
          if answer_input == "no"
            # display order summary
            new_burger.return_order

            # ask user if they want to make another order
            # if yes, restart order
            puts "Want to make another order?"
            puts "Yes or No"
            another_order_input = gets.chomp.downcase
            
            if another_order_input == "yes"
              Order.new.begin
            else
              return
            end
          end
        when "no"
          # display order summary
          new_burger.return_order

          # ask user if they want to make another order
          # if yes, restart order
          puts "Want to make another order?"
          puts "Yes or No"
          another_order_input = gets.chomp.downcase
          
          if another_order_input == "yes"
            Order.new.begin
          else
            return
          end
        end
      end
    end
  end
end 

Order.new.begin
