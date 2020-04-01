def first_anagram?(str)
  str.chars.permutation(str.length).to_a.map(&:join)
end

def anagram?(str1, str2)
  first_anagram?(str1).include?(str2)
end

def second_anagram?(str1, str2)
  a1 = str1.chars
  a2 = str2.chars

  a1.each_with_index do |c1, i|
    idx = a2.find_index(c1)
    return false if idx.nil?
    a2.delete_at(idx)

  end

  a2.empty?
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort 
end

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.chars.each { |ele| hash1[ele] += 1 }
  str2.chars.each { |ele| hash2[ele] += 1 }

  hash2 == hash1

end


