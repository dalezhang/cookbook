class IngredientsController < ApplicationController

  def index
    ingredients
    @ingredient ||= Ingredient.new
  end

  def create
    @ingredient ||= Ingredient.new(name:  params[:ingredient][:name],
                                   color: params[:ingredient][:color],
                                   count: params[:ingredient][:count])
    if @ingredient.valid?
      @ingredient.save
      redirect_to ingredients_path
    else
      ingredients
      render :index, format: :html
    end
  end

  def update
    @ingredient ||= Ingredient.find_by(id: params[:id])
    @ingredient.update(name:  params[:ingredient][:name],
                       color: params[:ingredient][:color],
                       count: params[:ingredient][:count])
    if @ingredient.valid?
      @ingredient.save
      redirect_to ingredients_path
    else
      ingredients
      render :index, format: :html
    end
  end

  private

  def ingredients
    @ingredients ||= Ingredient.all
  end
end