# [1, 2, 3].each do |num|
#   puts num
# end

def hello
  puts "Hi!"
end

# hello { puts "hey hey!" }

def echo_with_yield(str)
  yield if block_given?
  str
end

# puts echo_with_yield('hello') { puts 'world' }
# puts echo_with_yield('hello')

# 3.times do |num|
#   puts num
# end

def increment(number)
  if block_given?
    yield(number + 1)
  end
  number + 1
end

# increment(5) { |num| puts num } # => 6 is output and returned

def test
  yield(1, 2)
end

# test { |num| puts num } # => `1` is output, no error

def test2
  yield(1)
end

# test2 { |num1, num2| puts "#{num1} #{num2}"} # `1 ` is output, no error

def test3(&block)
  puts "What is &block? #{block}"
end

test3 { sleep(1) }

def sequence
  counter = 0
  Proc.new { counter += 1 }
end

s1 = sequence
p s1.call           # => 1
p s1.call           # => 2
p s1.call           # => 3
puts

s2 = sequence
p s2.call           # => 1
p s1.call           # => 4 (note: this is s1)
p s2.call           # => 2