# frozen_string_literal: true
require 'rspec'
require 'approvals/rspec'

require_relative '../lib/gilded_rose'
require_relative '../lib/item'
require_relative '../lib/aged_item'
require_relative '../lib/backstage_pass'
require_relative '../lib/conjured_item'
require_relative '../lib/legendary_item'
require_relative '../lib/regular_item'

describe GildedRose do
  it 'knows how to update quality for items' do
    subject = GildedRose.new(items)

    verify { characterize(subject, 20) }
  end
end

private

def items
  [
    RegularItem.new('Mail Armour', 10, 20),
    RegularItem.new('Mail Armour', 10, 1),
    RegularItem.new('+5 Dexterity Vest', 10, 20),
    RegularItem.new('Elixir of the Mongoose', 5, 7),
    AgedItem.new('Aged Brie', 4, 9),
    AgedItem.new('Aged Brie', 1, 49),
    AgedItem.new('Aged Stilton', 1, 29),
    AgedItem.new('Aged Elvish Wine', 1, 29),
    BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 15, 17),
    BackstagePass.new('Backstage passes to the Rat Queens', 15, 17),
    BackstagePass.new('Backstage passes to the Hard Rock Troll Orchestra', 15, 17),
    BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 5, 49),
    ConjuredItem.new('Conjured boots of discomfort', 5, 49),
    ConjuredItem.new('Conjured loincloth', 5, 49),
    ConjuredItem.new('Conjured fake beard', 5, 49),
    # TODO: Remove -1 special value
    LegendaryItem.new('Sulfuras, Hand of Ragnaros', -1, 80)
  ]
end

def characterize(subject, days)
  characterization = []

  (1..days).each_with_index do |day|
    subject.update_quality

    characterization << "Day #{day} of #{days}"
    subject.items.each { |item| characterization << "  #{item}" }
  end

  characterization.join("\n")
end
