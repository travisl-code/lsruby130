=begin

Input: Array (and block)
Output: integer
- Integer output represent number of times block returns true
- Cannot use existing `#count` methods
- Return 0 if empty array input

Examples: 
count([1,2,3,4,5]) { |value| value.odd? } == 3
count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
count([1,2,3,4,5]) { |value| true } == 5
count([1,2,3,4,5]) { |value| false } == 0
count([]) { |value| value.even? } == 0
count(%w(Four score and seven)) { |value| value.size == 5 } == 2

Data Structures:
Array input
- Pass elements to block
- Boolean returns from block
- Integer count for returns
Integer output

Algorithm:
Initialize a true_count variable to 0
Iterate through items in collection. For each...
- Yield to block
- If block return is truthy, increment true_count
Return true_count

=end

def count(collection)
  true_count = 0
  collection.each { |item| true_count += 1 if yield(item) }
  true_count
end

# p count([1,2,3,4,5]) { |value| value.odd? } == 3
# p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
# p count([1,2,3,4,5]) { |value| true } == 5
# p count([1,2,3,4,5]) { |value| false } == 0
# p count([]) { |value| value.even? } == 0
# p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# Further: Don't use `each`, `loop`, `while`, or `until`

def count2(collection)
  true_count = 0
  for item in collection
    true_count += 1 if yield(item)
  end

  true_count
end

p count2([1,2,3,4,5]) { |value| value.odd? } == 3
p count2([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count2([1,2,3,4,5]) { |value| true } == 5
p count2([1,2,3,4,5]) { |value| false } == 0
p count2([]) { |value| value.even? } == 0
p count2(%w(Four score and seven)) { |value| value.size == 5 } == 2