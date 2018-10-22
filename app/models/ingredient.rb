class Ingredient < ActiveRecord::Base
  has_many :burgerIngredients
  has_many :burgers, through: burgerIngredients
end
