class DailyDish < ApplicationRecord
  belongs_to :food
  before_create :take_out_ingredients
  before_destroy :add_back_ingredients
  delegate :name , to: :food, allow_nil: true, prefix: true

  def take_out_ingredients
    food.food_ingredients.each do |food_ingredient|
      food_ingredient.ingredient.count -= food_ingredient.count
      food_ingredient.ingredient.save
    end
  end

  def add_back_ingredients
    food.food_ingredients.each do |food_ingredient|
      food_ingredient.ingredient.count += food_ingredient.count
      food_ingredient.ingredient.save
    end
  end

end
