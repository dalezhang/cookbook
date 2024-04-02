class FoodsController < ApplicationController
  def index
    @food ||= nil
    @ingredients ||= nil
    foods
  end

  def create
    @food = Food.new(name:  params[:food][:name])
    binding.pry
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
    @foods ||= Food.all
  end
end