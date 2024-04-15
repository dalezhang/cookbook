class FoodsController < ApplicationController
  def index
    @food ||= Food.new
    @ingredients ||= nil
    foods
  end

  def create
    @food = Food.new(name:  params[:food][:name])
    if @food.valid?
      @food.save
      (params[:food][:ingredient_ids] || []).each do |ingredient_id|
        @food.food_ingredients.find_or_create_by(ingredient_id: ingredient_id, count: params[:food][:ingredients][ingredient_id][:count])
      end
      redirect_to foods_path
    else
      foods
      render :index
    end
  end

  def update
    @food = Food.find_by(id: params[:id])
    @food.name = params[:food][:name]
    @food.food_ingredients.where.not(ingredient_id: params[:food][:ingredient_ids]).destroy_all
    (params[:food][:ingredient_ids] || []).each do |ingredient_id|
      @food.food_ingredients.find_or_create_by(ingredient_id: ingredient_id, count: params[:food][:ingredients][ingredient_id][:count])
    end
    if @food.valid?
      @food.save
      redirect_to foods_path
    else
      foods
      render :index
    end
  end

  private
  def foods
    @foods ||= Food.all.order(updated_at: :desc)
  end
end