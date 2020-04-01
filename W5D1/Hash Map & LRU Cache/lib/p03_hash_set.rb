#bundle exec rspec ./spec/p03_hash_set_spec.rb
require "p01_int_set"
class HashSet < ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    # resize! if @count >= num_buckets
    # self[key].push(key)
    # @count += 1
    super
  end

  def include?(key)
    # self[key].include?(key)
    super
  end

  def remove(key)
    # (self[key].delete(key) ; @count -= 1) if include?(key)
    super
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    # flattened = @store.flatten
    # @store = Array.new(num_buckets * 2) {[]}
    # @count = 0
    # flattened.each { |ele| insert(ele) }
    super
  end

end
