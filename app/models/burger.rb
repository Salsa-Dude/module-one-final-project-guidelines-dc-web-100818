
class Burger < ActiveRecord::Base
  has_many :burgerIngredients
  has_many :ingredients, through: :burgerIngredients
end