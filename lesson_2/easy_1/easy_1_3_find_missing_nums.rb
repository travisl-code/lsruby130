=begin

Input: Sorted array
- Contains integers, pos and neg
- Integers might be missing from array
- May be single-element array
Output: array
- contains integers missing from the sorted input array
- return empty array if no ints missing

Examples:
missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

Data Structures:
Array for results: []
Array input: [1, 5]
Integer elements (iter): 1, then 5
Integers into results

Algorithm:
Create empty results array
Iterate through input array
Initialize last_int to array's first value
- Track last_int in variable
- If last_int is >= 2 larger than current
  - From last int to current (not inclusive), add to results

=end

def missing(arr)
  results = []
  last_int = arr.first

  arr.each do |current_int|
    diff = (current_int - last_int).abs
    if diff > 2
      (last_int + 1).upto(current_int - 1) { |num| results << num }
    end
    last_int = current_int
  end

  results
end

p missing([-3, -2, 1, 5]) #== [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) #== []
p missing([1, 5]) #== [2, 3, 4]
p missing([6]) #== []
