#bundle exec rspec ./spec/p01_int_set_spec.rb

class MaxIntSet

  attr_reader :max, :store
  def initialize(max)
    @store = Array.new(max) {false}
    @max = max
  end

  def insert(num)
    raise "Out of bounds" if num > max || num < 0
    if store[num]
      return false 
    else
      store[num] = true
      return true
    end 
  end

  def remove(num)
    if store[num]
      store[num] = false
      return true 
    else
      return false
    end
  end

  def include?(num)
   store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % num_buckets
    @store[i].push(num)
  end

  def remove(num)
    i = num % num_buckets
    @store[i].delete(num)
  end

  def include?(num)
    i = num % num_buckets
    @store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def include?(num)
    self[num].include?(num)
  end
  #@count = number of elements in the store
  #resize when count is >= to the number of buckets
  #buckets = 20, -> resize -> 40 buckets

  def insert(num)
    resize! if @count >= num_buckets
    unless self[num].include?(num)
      self[num].push(num)
      @count += 1
      return true
    end 
    false
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
      return true
    end 
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_size = num_buckets * 2
    flattened = @store.flatten
    @store = Array.new(new_size) { Array.new }
    @count = 0
    flattened.each { |el| self.insert(el) }
  end

end
