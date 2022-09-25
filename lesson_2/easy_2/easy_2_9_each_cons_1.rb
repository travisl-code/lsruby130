=begin

Input: array, block
- 2 elements passed to block at a time
Output: nil
- nil return
- should process block

Examples:
hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
result == nil
hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
hash == {}
result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
hash == {'a' => 'b'}
result == nil


Data Structures:
Array input: [1, 3, 6, 10]
Sliced arrays (to block): [1, 3], [3, 6], [6, 10]
`nil` ouput (not really used)

Algorithm:
Iterate through input array with index. Each iteration...
- Break if the index is the last in the input array
- yield to block current element and element idx + 1
Return nil

=end

def each_cons(arr)
  arr.each_with_index do |item, idx|
    break if idx == (arr.size - 1)
    yield(item, arr[idx + 1])
  end

  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil
