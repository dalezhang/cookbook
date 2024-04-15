class FoodIngredient < ApplicationRecord
  belongs_to :food
  belongs_to :ingredient
  delegate :name, :color, to: :ingredient, allow_nil: true, prefix: true
end
