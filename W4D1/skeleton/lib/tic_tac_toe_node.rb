require_relative 'tic_tac_toe'
require "byebug"

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return true if board.over? && board.winner != evaluator && !board.winner.nil?

    childs = self.children
  
    childs.each do |child|
      return false if !child.losing_node?(evaluator)
    end

    false

  end

  def winning_node?(evaluator)

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    possible_moves = []
    next_mover_mark == :x ? new_mark = :o : new_mark = :x
    @board.rows.each_with_index do |row, i|
      (0...row.length).each do |j|
        new_node = TicTacToeNode.new(@board.dup, new_mark, [i, j])
        new_node.board.rows[i][j] = new_mark
        possible_moves << new_node if @board.rows[i][j].nil?
      end
    end
    possible_moves
  end

  def inspect
    @prev_move_pos
  end

end
