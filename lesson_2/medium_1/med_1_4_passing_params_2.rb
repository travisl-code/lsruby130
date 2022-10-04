=begin
Array assigned to variable:
birds = %w(raven finch hawk eagle)
p birds # => ['raven','finch','hawk','eagle']

Every element to separate variable:
raven, finch, hawk, eagle = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p hawk # => 'hawk'
p eagle # => 'eagle'

Variables for category names:
raven, finch, *raptors = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p raptors  # => ['hawk','eagle']


Input: Array
Output: Raptors Array
- Ignores first 2 elements of array input


=end

birds = %w(raven finch hawk eagle)

def method_1(arr)
  raptors = yield(arr)

  raptors
end

raptors = method_1(birds) { |arr| arr[2..-1] }
p raptors
 