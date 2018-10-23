class UpdateColumnDatatype < ActiveRecord::Migration[5.0]
  def change
    change_column :ingredients, :price, :float
  end
end
