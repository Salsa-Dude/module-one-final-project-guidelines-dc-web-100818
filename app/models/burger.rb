require 'pry'
class Burger < ActiveRecord::Base
  attr_accessor :logo
  has_many :burger_ingredients
  has_many :ingredients, through: :burger_ingredients

  
  def menu_output
    p "TYPE AN INGREDIENT"
    puts '
     _ __ ___   ___ _ __  _   _ 
    |  _ ` _ \ / _ \  _ \| | | |
    | | | | | |  __/ | | | |_| |
    |_| |_| |_|\___|_| |_|\__,_|
    '
    count = 0
    puts Ingredient.all.map {|ing| "#{count += 1}. #{ing.name} -------- $#{ing.price}" }
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

  def delete_ingredient(ingredient)
    self.ingredients.select do |ing|
      if ingredient == ing
        self.ingredients.delete(ing)
      end
    end
  end

  def return_order
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
      puts self.total_price

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