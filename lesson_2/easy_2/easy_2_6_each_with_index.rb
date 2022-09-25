=begin

Input: array, block
Output: original array

Examples:
result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

Example output...
0 -> 1
1 -> 3
2 -> 36
true

=end

def each_with_index(arr)
  idx = 0
  while idx < arr.size do
    yield(arr[idx], idx)
    idx += 1
  end

  arr
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
