# frozen_string_literal: true

class FoodReflex < ApplicationReflex
  before_reflex do
    @food = element.dataset.id ? Food.find_by(id: element.dataset.id) : Food.new
  end
  def new
    @food
  end

  def edit(id = element.dataset[:id])
    @food = Food.find_by(id: id)
  end

  def submit
    @food.name = params[:food][:name]
    @food.food_ingredients.where.not(ingredient_id: params[:food][:ingredient_ids]).destroy_all
    if @food.valid?
      @food.save
      (params[:food][:ingredient_ids] || []).each do |ingredient_id|
        food_ingredient = @food.food_ingredients.find_or_initialize_by(ingredient_id: ingredient_id)
        food_ingredient.count = params[:food][:ingredients][ingredient_id][:count]
        food_ingredient.save
      end
      @food = nil
    end
  end

  def delete
    @food&.destroy
  end

end
