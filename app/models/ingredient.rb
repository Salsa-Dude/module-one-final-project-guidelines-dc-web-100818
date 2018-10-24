class Ingredient < ActiveRecord::Base
  has_many :burger_ingredients
  has_many :burgers, through: :burger_ingredients

  
end
