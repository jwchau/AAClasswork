require 'card'

describe Card do
  subject(:card) { Card.new(:spade, "4") }
  describe "#initialize" do
    it "should have a face_value" do 
      expect(card.face_value).to_not be(nil)
    end
    it "should have a suit" do
      expect(card.suit).to_not be(nil)
    end
  end

end