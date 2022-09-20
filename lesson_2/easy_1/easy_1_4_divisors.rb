=begin

Input: positive integer
Output: Array
- list of divisors of the input int
- does not have to be ordered

Divisor: Evenly divisible number (12 dvisible by 1, 2, 3, 4, 6, and 12) -- these are its divisors

Examples:
divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

Data Structures:
Results array: []
Integer input: 12
Integer for modulus: 12 % 12
Integer for subtraction: 12 - 1 (12 % 11, 12 % 10, 12 % 9, etc)

Algorithm:
Create empty array results
Set current_num to input
LOOP until current_num is 1:
- Take modulus of input % current_num
- If modulus == 0, prepend to results
- Subtract 1 from current_num
Return results

=end

def divisors(int)
  results = []
  current_num = int

  while current_num > 0
    results.prepend(current_num) if int % current_num == 0
    current_num -= 1
  end

  results
end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# Further: Improve algorithm for performance?

def divisors2(n)
  results = []
  limit = Math.sqrt(n).to_i
  1.upto(limit) do |current_num|
    results << current_num if n % current_num == 0
  end
  results
end

p divisors2(99400891) #== [1, 9967, 9973, 99400891]
