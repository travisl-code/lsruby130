# method like `Range#step`

=begin

Input: 3 args:
- 1) starting value
- 2) ending value
- 3) "step" value
- Also takes a block for yielding
Output: choice of return
- Return nil?
- Return last value?
- Return range of start/end?

Examples:
step(1, 10, 3) { |value| puts "value = #{value}" }

outputs...
value = 1
value = 4
value = 7
value = 10

Data Structures:
Integer inputs
Output questionable

Algorithm:
Initialize begin to value of start
LOOP until begin is > end
  - Pass begin to block
Return range of (start..end)

=end

def step(start_val, end_val, step_val)
  begin_val = start_val

  until begin_val > end_val
    yield(begin_val)
    begin_val += step_val
  end

  (start_val..end_val)
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
