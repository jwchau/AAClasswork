require_relative 'card.rb'

class Deck
  SUITS = [:spade, :heart, :diamond, :club]
  FACE_VALUE = (2..9).to_a.map(&:to_s) + ["T", "J", "Q", "K", "A"]

  attr_accessor :store

  def initialize
    @store = Array.new()
    make_deck
    shuffle
  end

  def make_deck
    FACE_VALUE.each do |face|
      SUITS.each do |suit|
        store << Card.new(suit, face)
      end
    end
  end

  def length
    store.length
  end

  def [](index)
    store[index]
  end

  def shuffle
    self.store.shuffle!
  end

end