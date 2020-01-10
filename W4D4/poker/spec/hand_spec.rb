require 'hand'
require 'deck'

describe Hand do
  subject(:hand) { Hand.new(deck) }
  let(:deck) { Deck.new }
  
  describe "#initialize" do
    it "should take in a deck" do
      expect(hand.deck).to_not be nil
    end

    it "take five cards from deck" do
      expect(hand.store.length).to eq 5
    end


  end

end