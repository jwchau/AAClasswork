require "byebug"

def wmr(arr, w)
  cmr = nil
  window = []
  arr.each do |ele|
    window.shift if window.length == w
    window << ele if window.length < w
    cr = window.max - window.min
    cmr = cr if cmr.nil? || cr > cmr
  end
  cmr
end

class MyQueue

  
  def initialize
    @store = []
  end

  def peek
    store.first
  end

  def size
    store.length
  end

  def empty?
    store.empty?
  end

  def enqueue(value)
    store.unshift(value)
  end

  def dequeue
    store.shift
  end

  private

  attr_reader :store

end


class MyStack
  attr_accessor :high, :low

  def initialize
    @store = []
    @high = 0
    @low = 0
  end

  def peek
    store.last
  end

  def size
    store.length
  end

  def empty?
    store.empty?
  end

  def pop 
    num = store.pop
    self.low = store.min if num == low
    self.high = store.max if num == high
    num
  end

  def push(value)
    store.push(value)
    self.high = value if high < value
    self.low = value if low > value
  end

  private

  attr_reader :store

end

# arr[i..i + w]

class StackQueue
  def initialize
    @stak1 = MyStack.new
    @stak2 = MyStack.new
  end

  def size
    stak1.size
  end

  def empty?
    stak1.empty?
  end

  #
  def enqueue(value)
    stak1.push(value)
  end

  def dequeue
    until stak1.empty?
      stak2.push(stak1.pop)
    end

    deq = stak2.pop

    until stak2.empty?
      stak1.push(stak2.pop)
    end

    deq
  end

  private

  attr_reader :stak1, :stak2

end




# p wmr([1, 2, 5, 4, 8], 2) #== 4 # 4, 8
# p wmr([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# p wmr([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# p wmr([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8