class BurgerIngredient < ActiveRecord::Migration[5.0]
  def change
    create_table :burgerIngredient do |t|
      t.integer :burger_id
      t.integer :ingredient_id
    end
  end
end
