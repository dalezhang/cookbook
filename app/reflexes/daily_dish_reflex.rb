# frozen_string_literal: true

class DailyDishReflex < ApplicationReflex

  def delete
    DailyDish.find_by(id: element.dataset[:id]).destroy
  end

end
