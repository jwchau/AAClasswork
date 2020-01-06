require_relative "../polytree/lib/00_tree_node.rb"
require "byebug"

class KnightPathFinder
  attr_reader :root_node

  def initialize(pos = [0, 0])
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
    possible_moves = [[2, 1], [1, 2], [-2, 1], [-1, 2], 
                      [2, -1], [1, -2], [-2, -1], [-1, -2]]
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
    
  def find_path(node, end_pos)
    return node if node.value == end_pos

    node.children.each do |child|
      curr_node = find_path(child, end_pos)
      return curr_node unless curr_node.nil?
    end

    nil
  end

  # def dfs(target)
  #   return self if value == target

  #   children.each do |child|
  #     check = child.dfs(target)
  #     return check unless check.nil?
  #   end

  #   nil
  # end

  def trace_path_back(end_node)
    return [root_node] if end_node.parent.nil?

    trace_path_back(end_node.parent) + [end_node]
  end

  
  #third call node of [0,0]
  #parent is nil 
  #[00]

  #second call node of [2,1]
  #end_node = node[2,1] 
  #temp = [00]
  #temp = [00, 21]
  

  #first call of trace_path_back
  #when end_node == node of [4,2]
  #temp = [00, 21]
  #[ 00, 21, 42]


  def get_path(nodes)
    nodes.map(&:value).reverse
  end

  def inspect
    @root_node.value
  end

end

knight = KnightPathFinder.new([0, 0])
knight.build_move_tree

#found the node that was requested
# knight.find_path

#knight.trace_back(a)