class CreateBurgerIngredient < ActiveRecord::Migration[5.0]
  def change
    create_table :burger_ingredients do |t|
      t.integer :burger_id
      t.integer :ingredient_id
    end
  end
end
