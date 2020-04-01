def bad_two_sum?(arr, target_sum)
  (0...arr.length).each do |i|
    (i + 1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end

def okay_two_sum?(arr, target_sum)
  sorted = arr.sort
  i = 0
  j = arr.length - 1
  while i < j
    sum = arr[i] + arr[j]
    if sum == target_sum
      return true
    elsif sum < target_sum
      i += 1
    else
      j -= 1
    end
  end

  false
end

def two_sum?(arr, target_sum)
  hash = Hash.new
  arr.each do |ele|
    comp = target_sum - ele
    return true if hash.has_key?(ele)
    hash[comp] = ele
  end
  false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false
puts
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
puts
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false