class HomeController < ApplicationController
  def index
    @daily_dishes = DailyDish.includes(food: [:food_ingredients, :ingredients]).where("created_at > ?", Time.current.beginning_of_day)
  end
end


