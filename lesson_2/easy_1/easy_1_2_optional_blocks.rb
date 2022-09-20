=begin

Input: optional block
Output: execution of block (if provided)
- If no block, return string "Does not compute"

Examples:

compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'

Data Structures:
Block input (and structure execution)
String output if no block

Algorithm:
Test if block given
- If NO: output string
- If YES: execute block

=end

def compute
  if block_given?
    yield
  else
    'Does not compute.'
  end
end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

# Further: Modify `compute` to take single arg and yield that arg to the block. Provide 3 examples of new method, including no-block call

def compute2(block_arg)
  return 'Does not compute.' unless block_given?
  yield(block_arg)
end

p compute2(3) { |x| puts "x's value: #{x}" } == nil
p compute2('a') { |x| x + 'b' } == 'ab'
p compute2(3) == 'Does not compute.'