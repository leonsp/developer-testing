# frozen_string_literal: true
require 'item'

class AgedItem < Item
  def update_quality
    @sell_in -= 1

    @quality += 1 if @quality < 50

    return unless @sell_in < 0
    @quality += 1 if @quality < 50
  end
end
