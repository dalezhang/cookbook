class FoodsController < ApplicationController
  def index
    @food ||= Food.new
    @ingredients ||= nil
    foods
  end
  def add_to_daily_dish
    @food = Food.find_by(id: params[:id])
    if @food.ingredients_sufficient?
      DailyDish.create(food: @food)
      redirect_to root_path
    else
    end
  end

  private
  def foods
    @foods ||= Food.all.order(updated_at: :desc)
  end
end