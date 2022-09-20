=begin

Write an `any?` method to behave like `Enumerable#any?`.

Input: Array as argument, and block
Output: boolean true or false
- true if any block evaluates to true
- stop processing if block returns true
- return false if array empty
- don't use standard methods

Examples:
any?([1, 3, 5, 6]) { |value| value.even? } == true
any?([1, 3, 5, 7]) { |value| value.even? } == false
any?([2, 4, 6, 8]) { |value| value.odd? } == false
any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
any?([1, 3, 5, 7]) { |value| true } == true
any?([1, 3, 5, 7]) { |value| false } == false
any?([]) { |value| true } == false

Data Structures:
Array input
Block input

Algorithm:
Iterate through input array. Each element...
- Pass element as argument to block

=end

require 'pry'

def any?(arr, &block)
  return false if arr.empty?
  counter = 0

  while counter < arr.size
    # binding.pry
    return true if block.call arr[counter]
    counter += 1
  end

  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
