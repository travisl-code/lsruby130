arr = [1, 2, 3]

p arr.map { |num| num.to_s } # => ['1', '2', '3']
p arr.map(&:to_s) # => ['1', '2', '3']
