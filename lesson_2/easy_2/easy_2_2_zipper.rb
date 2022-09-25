# write a custom `Array#zip` method

=begin

Input: 2 array arguments
- both input arrays have same number of elements
Output: New array (don't modify old)
- first element from first array and first element from second array make up first element of new array, etc.
- should be in order


Examples:
zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

Data Structures:
Input 2 arrays
Integers for indexes
Output nested array

Algorithm:
Set index to 0
Create results array empty
Iterate through first array. Each element...
- Create subarray
- Add current item and array2 item to subarray
- Push subarray to results
Return results

=end

def zip(arr1, arr2)
  results = []

  arr1.each_with_index do |item, idx|
    subarr = []
    subarr << item << arr2[idx]
    results << subarr
  end

  results
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
