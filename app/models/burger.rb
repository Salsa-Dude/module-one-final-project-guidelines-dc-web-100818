require 'pry'
class Burger < ActiveRecord::Base
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

  def price
    "Your current price $#{ self.ingredients.map{|ing| ing.price}.reduce(:+)}"
  end


      # total_price = self.ingredients.map{|ing| ing.price}.reduce(:+)
      # p "Your price is #{n_b_ingredient.ingredient.price}"
  
end