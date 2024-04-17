class Food < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :food_ingredients, dependent: :destroy
  has_many :ingredients, through: :food_ingredients
  has_many :daily_dishes, dependent: :destroy

  def ingredients_sufficient?
    food_ingredients.all? { |food_ingredient| food_ingredient.count <= food_ingredient.ingredient.count }
  end
end
