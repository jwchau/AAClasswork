class Piece
  attr_accessor :type

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s

  end 

  def empty?

  end

  def moves
    raise NoMethodError
  end

  def valid_moves
    raise NoMethodError
  end

  def pos=(value)
    @pos = value
  end

  def symbol 

  end

  # def inspect 
  #   self.to_s
  # end

  private

  def move_into_check?(end_pos)

  end

end