# frozen_string_literal: true

class FoodReflex < ApplicationReflex

  def validate_name(name)
    @food = Food.new(name: name)
    @food.valid?
  end

  def new
    @food = Food.new
  end

  def edit(id = element.dataset[:id])
    @food = Food.find_by(id: id)
  end

  def update
    @food = Food.find_by(id: element.dataset[:id])
    bining.pry
    case element.dataset[:attribute]
    when "name"
      @food.name = element[:value]
    end
    if @food.valid?
      @food.save
      @food = nil
    end
  end

  def toggle
    food = Food.find_by(id: element.dataset[:id])
    food.update(exist: !food.exist)
  end

  def create
    @food = Food.new(name: params.dataset[:name])
    bining.pry
    if @food.valid?
      @food.save
      @food = nil
    end
  end

  def delete
    Food.find_by(id: element.dataset[:id]).destroy
  end

end
