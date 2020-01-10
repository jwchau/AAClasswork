require 'towers'

describe Tower do
  subject(:tower) {Tower.new}
  describe "#initialize" do
    it "creates a tower object" do
      expect(tower.is_a?(Tower)).to be(true)
    end

  end

  describe "#move" do
    it "takes user input: ask what pile to 
        selects a disc from, and where to put it." do
          tower.move
          expect(tower.piles[2].first).to_not eq(nil)
        end
  end

  describe "#won?" do
    it "checks if the game has been won after every move" do
      tower.winning_tower
      expect(tower.won?).to be(true)
    end
  end
  

end