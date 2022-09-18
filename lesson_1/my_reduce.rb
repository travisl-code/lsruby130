def reduce(collection, accumulator = nil)
  if accumulator
    idx = 0
  else
    idx = 1
    accumulator = collection[idx - 1]
  end


  while idx < collection.size
    current_element = collection[idx]
    block_result = yield(accumulator, current_element)
    accumulator = block_result
    idx += 1
  end

  accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
