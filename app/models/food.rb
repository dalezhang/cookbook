class Food < ApplicationRecord
  has_many :food_ingredients, dependent: :destroy
  has_many :ingredients, through: :food_ingredients
end
