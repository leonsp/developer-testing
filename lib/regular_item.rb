# frozen_string_literal: true
require 'item'

class RegularItem < Item
  def update_quality
    @sell_in -= 1
    @quality -= 1 if @quality > 0
    @quality -= 1 if @quality > 0 && @sell_in < 0
  end
end
