# frozen_string_literal: true
require 'item'

class ConjuredItem < Item
  def update_quality
    @sell_in -= 1
    @quality -= 2 if @quality > 0
    @quality -= 2 if @quality > 0 && @sell_in < 0
    @quality = 0 if @quality < 0
  end
end
