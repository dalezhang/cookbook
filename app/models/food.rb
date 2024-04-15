class Food < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :food_ingredients, dependent: :destroy
  has_many :ingredients, through: :food_ingredients

  def ingredients_sufficient？
    food_ingredients.all? { |food_ingredient| food_ingredient.count >= food_ingredient.ingredient.count }
  end
end
