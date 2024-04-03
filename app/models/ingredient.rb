class Ingredient < ApplicationRecord
  has_many :food_ingredients, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
