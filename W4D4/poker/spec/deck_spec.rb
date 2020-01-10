require 'deck'


  
describe Deck do
  subject(:deck) { Deck.new }
  

  describe "#initialize" do
    it "should have 52 cards" do
      expect(deck.length).to eq 52
    end

    it "should have 13 of every suit" do
      hash = Hash.new(0)
      deck.store.each do |card|
        hash[card.suit] += 1
      end
      expect(hash[:spade]).to eq(13)
      expect(hash[:diamond]).to eq(13)
      expect(hash[:heart]).to eq(13)
      expect(hash[:club]).to eq(13)
    end

    it "should have 4 of every face value" do
      hash = Hash.new(0)
      deck.store.each do |card|
        hash[card.face_value] += 1
      end
      faces = (2..9).to_a.map(&:to_s) + ["T", "J", "Q", "K", "A"]
      faces.each do |face| 
        expect(hash[face]).to eq(4)
      end
    end
  end 

  describe "#shuffle" do
    it "shuffles the deck" do
      shuf = Deck.new.shuffle
      expect(shuf).to_not eq(deck.store)
    end
  end

  describe "#draw" do
    it "should take five cards and remove from deck" do
      hand.store = deck.store.take(5)
      deck.store = deck.store.drop(5)
    end
  end

end