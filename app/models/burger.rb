require 'pry'
class Burger < ActiveRecord::Base
  attr_accessor :logo
  has_many :burger_ingredients
  has_many :ingredients, through: :burger_ingredients

  
  def menu_output
    p "Type an ingredient"
    puts "*****MENU******"
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
    "Your current price $#{ self.ingredients.map{|ing| ing.price}.reduce(:+)}"
  end

  def delete_ingredient(ingredient)
    self.ingredients.select do |ing|
      if ingredient == ing
        self.ingredients.delete(ing)
      end
    end
  end


      # total_price = self.ingredients.map{|ing| ing.price}.reduce(:+)
      # p "Your price is #{n_b_ingredient.ingredient.price}"
  
end