class IngredientsController < ApplicationController

  def index
    ingredients
    @ingredient ||= Ingredient.new
    @edit_ingredient_id ||= nil
  end

  def create

    @ingredient ||= Ingredient.new(name:  params[:ingredient][:name])
    if @ingredient.valid?
      @ingredient.save
      redirect_to ingredients_path
    else
      ingredients
      # binding.pry
      render :index, format: :html
    end
  end

  private

  def ingredients
    @ingredients ||= Ingredient.all
  end
end