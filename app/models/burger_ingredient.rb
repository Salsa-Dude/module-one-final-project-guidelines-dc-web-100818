class BurgerIngredient < ActiveRecord::Base
  belongs_to :burger
  belongs_to :ingredient
end