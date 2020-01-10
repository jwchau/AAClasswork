require_relative 'deck.rb'

class Hand
  attr_reader :deck, :store

  def initialize(deck)
    @deck = deck
    @store = [deck.draw(5)]
  end

end