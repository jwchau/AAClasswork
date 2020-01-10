class Card

  attr_reader :suit, :face_value
  def initialize(suit, face_value)
    @suit = suit
    @face_value = face_value
  end

  # def ==(other_card)
  #   self.suit == other_card.suit
  #   self.face_value == other_card.face_value
  # end


  # def inspect
  #   [suit, face_value]
  # end

end