class CreateDailyDishes < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_dishes do |t|
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
