=begin

Input: Array, Integer, and block
- Array is for iteration
- Integer represents how many consecutive elements to pass to block
Output: return nil
- cons items from input array should be passed to block
- if input Int is > array size, no processing

Examples:
hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}


Data Structures:
Array input: [1, 3, 6, 10]
Integer input: 4
Iterations total: arr size - int
Index numbers: 0..3 (1, [3, 6, 10])
Return nil

Algorithm:
Iterate through input array with index. Each item...
- Slice array from current index to Int size
- Break if that array's size is < input integer
- Yield items to block: 

Return nil

=end

def each_cons(arr, cons_size)
  # total_iterations = arr.size - cons_size
  # return nil if total_iterations < 0

  # 0.upto(total_iterations) do |idx|
  #   yield(arr[idx..(idx + cons_size)])
  # end

  idx = 0
  arr.each do |item|
    slice = arr[idx..(idx + (cons_size - 1))]
    break if slice.size < cons_size

    yield(*slice)
    idx += 1
  end

  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}
