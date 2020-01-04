require_relative "../polytree/lib/00_tree_node.rb"
require "byebug"

class KnightPathFinder
    attr_reader :root_node

    def initialize(pos)
        @pos = pos 
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    #unshift, and pop
    def build_move_tree
        queue = [@root_node]

        until queue.empty?
            curr_node = queue.pop
            new_pos = new_move_positions(curr_node.value)
            new_pos.each do |child|
                tree_child = PolyTreeNode.new(child)
                tree_child.parent = curr_node
                queue.unshift(tree_child)
            end
        end
    end

    def self.valid_moves(pos)
        possible_moves = [[2, 1], [1, 2], [-2, 1], [-1, 2], [2, -1], [1, -2], [-2, -1], [-1, -2]]
        possible_moves.reject! do |move|
            x, y = move
            (pos[0] + x < 0 || pos[0] + x > 8) || (pos[1] + y < 0 || pos[1] + y > 8)
        end

        possible_moves.map! do |move|
            move[0] += pos[0]
            move[1] += pos[1]
            move
        end
    end

    def new_move_positions(pos)
         new_moves = KnightPathFinder.valid_moves(pos).reject do |move|
            @considered_positions.include?(move)
         end
         @considered_positions += new_moves
         new_moves
    end

    
end