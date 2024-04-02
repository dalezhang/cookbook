class CreateFoodIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :food_ingredients do |t|
      t.references :food, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
