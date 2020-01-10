class Tower
  attr_accessor :piles

  

  def initialize
    #unshift and shift
    @piles = [[1, 2, 3], [], []]
  end


  def move
    idx1, idx2 = get_input

    ring = piles[idx1 - 1]
    if piles[idx2 - 1].first.nil? || !(piles[idx2 - 1].first > ring)
      piles[idx2 - 1].unshift(ring)
    else
      raise "Invalid move"
    end
    won?
  end


  def get_input

    return [1, 3]
  end

  def won?
    self.piles == [[], [], [1, 2, 3]] 

  end

  def winning_tower
    self.piles = [[], [], [1, 2, 3]] 
  end


end