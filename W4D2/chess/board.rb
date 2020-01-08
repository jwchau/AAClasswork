require_relative "null_piece.rb"
require_relative "steppers/" #need to require all files in this folder
require_relative "sliders/" #need to require all files in this folder
require_relative "pawn.rb"

class Board
  
  def initialize
    @null = NullPiece.instance
    @board = Array.new(8) { Array.new(8, @null) }
    # place_pieces

  end

  # def place_pieces_v2
  #   pieces = [[Rook.new]]
  #   board.each_with_index do |row, i|
  #     row.each_with_index do |cell, j|

  #     end
  #   end

  # end

  def place_pieces
    slider_pos  = [[0, 0], [0, 2], [0, 4], [0, 5], [0, 7], #black
                    [7, 0], [7, 2], [7, 4], [7, 5], [7, 7]]  #white
    stepper_pos = [[0, 1], [0, 3], [0, 6], [7, 1], [7, 3], [7, 6]]
    pawn = [[1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], 
            [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7]]
    
    slider_pos.each do |pos|
      x, y = pos
      if x == 0
        @board[x][y] = Slider.new("white", self, pos)
      else 
        @board[x][y] = Slider.new("black", self, pos)
      end
    end

    stepper_pos.each do |pos|
      x, y = pos
      if x == 0
        @board[x][y] = Stepper.new("white", self, pos)
      else 
        @board[x][y] = Stepper.new("black", self, pos)
      end
    end

    pawn.each do |pos|
      x, y = pos
      if x == 1
        @board[x][y] = Pawn.new("white", self, pos)
      else 
        @board[x][y] = Pawn.new("black", self, pos)
      end
    end
  end

  def move_piece(start_pos, end_pos)
    x, y = start_pos
    dx, dy = end_pos
    raise ArgumentError, "No piece at position" if board[x][y] == null
    # unless board[x][y].valid_moves.include?(end_pos)
    #   raise ArgumentError, "Not a valid move" 
    # end
    board[dx][dy] = board[x][y]
    board[dx][dy].pos= end_pos
    board[x][y] = null

  end

  private
  attr_reader :board, :null

end

b = Board.new



