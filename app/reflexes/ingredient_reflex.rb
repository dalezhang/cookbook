# frozen_string_literal: true

class IngredientReflex < ApplicationReflex

  def validate_name(name)
    @ingredient = Ingredient.new(name: name)
    @ingredient.valid?
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit(id = element.dataset[:id])
    @ingredient = Ingredient.find_by(id: id)
  end

  def update
    @ingredient = Ingredient.find_by(id: element.dataset[:id])
    case element.dataset[:attribute]
    when "name"
      @ingredient.name = element[:value]
    when "count"
      @ingredient.count = element[:value]
    when "color"
      @ingredient.color = element[:value]
    end
    if @ingredient.valid?
      @ingredient.save
      @ingredient = nil
    end
  end

  def toggle
    ingredient = Ingredient.find_by(id: element.dataset[:id])
    ingredient.update(exist: !ingredient.exist)
  end

  def create
    @ingredient = Ingredient.new(name: params.dataset[:name])
    if @ingredient.valid?
      @ingredient.save
      @ingredient = nil
    end
  end

  def delete
    Ingredient.find_by(id: element.dataset[:id]).destroy
  end

end
