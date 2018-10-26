require 'pry'
class Burger < ActiveRecord::Base
  attr_accessor :logo
  has_many :burger_ingredients
  has_many :ingredients, through: :burger_ingredients

  

  def menu_output
    puts '
     _ __ ___   ___ _ __  _   _ 
    |  _ ` _ \ / _ \  _ \| | | |
    | | | | | |  __/ | | | |_| |
    |_| |_| |_|\___|_| |_|\__,_|
    '
    count = 0
    puts Ingredient.all.map {|ing| "#{count += 1}. #{ing.name} -------- $#{ing.price}" }
    puts "TYPE AN INGREDIENT"
  end

  def output_ingredient
    self.ingredients.map{|ing| ing.name}
  end

  def check_ingredients
    if self.ingredients.length <= 0
      puts "Nothing here"
    end
  end 

  def price
    if self.ingredients.empty?
      "Your current price is $0"
    else
      "Your current price is $#{ self.ingredients.map{|ing| ing.price}.reduce(:+)}"
    end
  end

  def total_price
    if self.ingredients.empty?
      "Your current price is $0"
    else
    "Your total price is $#{ self.ingredients.map{|ing| ing.price}.reduce(:+)}"
    end
  end 

# NEED TO FIX 
  def delete_ingredient(ingredient)
    self.ingredients.select do |ing|
      if ingredient == ing
        self.ingredients.delete(ing)
      end
    end
  end

  def display_both_current_price
    p "CURRENT INGREDIENTS: #{self.output_ingredient}"
    p self.price
  end

  def return_order
    if self.output_ingredient.empty?
      puts '
       ______     __                 __  ____   
      / ____/__  / /_   ____  __  __/ /_/ / /   
     / / __/ _ \/ __/  / __ \/ / / / __/ / /    
    / /_/ /  __/ /_   / /_/ / /_/ / /_/_/_/     
    \____/\___/\__/   \____/\__,_/\__(_|_)      
                                              
    '
      return puts "IF YOU'RE NOT ORDERING ANYTHING!"
    else
      thankyou_message = "Thank you #{self.name}, come back again"
      `say -v "victoria" #{thankyou_message}`
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
      puts "Your hamburger contains #{self.output_ingredient}"
      puts self.total_price
    end
  end 


  
end