# frozen_string_literal: true

class IngredientReflex < ApplicationReflex

  def form
    @ingredient = Ingredient.new(name: element[:value])
    @ingredient.valid?
  end

  def edit
    @edit_ingredient_id = element.dataset[:id]
  end

  def update
    ingredient = Ingredient.find_by(id: element.dataset[:id])
    ingredient.name = element[:value]
    if ingredient.valid?
      @edit_ingredient_id = nil
      ingredient.save
    else
      @edit_ingredient_id = ingredient.id
      @edit_errors = ingredient.errors.messages
    end
  end

  def toggle
    ingredient = Ingredient.find_by(id: element.dataset[:id])
    ingredient.update(exist: !ingredient.exist)
  end

  def create
    @ingredient = Ingredient.new(name: params.dataset[:name])
    @ingredient.save!
    cable_ready.insert_adjacent_html(
      selector: "#ingredients",
      html: render(partial: "ingredients/ingredient", locals: { ingredient: @ingredient })
    ).broadcast
  end

  def delete
    Ingredient.find_by(id: element.dataset[:id]).destroy
  end

end
