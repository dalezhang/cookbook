class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.boolean :exist, default: true
      t.string :color
      t.integer :count, default: 1

      t.timestamps
    end
  end
end
