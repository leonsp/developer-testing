# frozen_string_literal: true
require 'item'

class BackstagePass < Item
  def update_quality
    @sell_in -= 1

    if @quality < 50
      @quality += 1
      if @sell_in < 10
        @quality += 1 if @quality < 50
      end
      if @sell_in < 5
        @quality += 1 if @quality < 50
      end
    end

    return unless @sell_in < 0

    @quality = 0
  end
end
