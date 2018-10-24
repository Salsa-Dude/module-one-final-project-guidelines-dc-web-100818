class Ingredient < ActiveRecord::Base
  has_many :burger_ingredients
  has_many :burgers, through: :burger_ingredients

  def createPrice(input)
    case input
    when "Lettuce"
      price = 0.20
    when "Tomato"
      price = 0.10
    when "Cheese"
      price = 0.30
    when "Onion"
      price = 0.5
    end
  end
  
end
