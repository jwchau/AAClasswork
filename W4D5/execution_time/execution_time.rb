def my_min(arr)
  (0...arr.length).each do |i|
    ele = arr[i]
    return ele if arr.all? { |ele2| ele <= ele2 }
  end
end

def my_min2(arr)
  result = arr.first
  (1...arr.length).each do |i|
    result < arr[i] ? result : result = arr[i]
  end
  result
end

# p my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])
# p my_min2([ 0, 3, 5, 4, -5, 10, 1, 90 ])

def largest_contiguous_subsum(list)
  subs = []
  i = 0
  while i < list.length
    j = i
    while j < list.length
      subs << list[i..j]
      j += 1
    end
    i += 1
  end
  
  subsum = []
  subs.each { |sub| subsum << sub.sum }
  subsum.max

end

def lcs(list)
  largest = list.first
  current = list.first
  list.each do |ele|
    largest = current if current > largest
    current + ele >= ele ? current += ele : current = ele
  end

  largest
end

#=================
#largest = 
#current = 

#ele = 
#

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])

list = [2, 3, -6, 7, -6, 7]
p lcs(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p lcs(list) # => -1 (from [-1])