class CreateBurger < ActiveRecord::Migration[5.0]
  def change
    create_table :burgers do |t|
      t.string :name
    end
  end
end
